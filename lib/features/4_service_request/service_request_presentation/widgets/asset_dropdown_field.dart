import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../core/utils/extensions/widget_extension.dart';
import '../../../../core/utils/methods.dart';
import '../../../7_assets/presentation/bloc/asset_cubit.dart';

class AssetNameDropDownSearchField extends StatefulWidget {
  final TextEditingController controller;
  final dynamic Function(SearchFieldListItem<String>) onSuggestionTap;
  final List<SearchFieldListItem<String>>? Function(String)?
      onSearchTextChanged;

  const AssetNameDropDownSearchField({
    super.key,
    required this.controller,
    required this.onSuggestionTap,
    this.onSearchTextChanged,
  });

  @override
  State<AssetNameDropDownSearchField> createState() =>
      _AssetNameDropDownSearchFieldState();
}

class _AssetNameDropDownSearchFieldState
    extends State<AssetNameDropDownSearchField> {
  final AssetBloc _assetBloc = AssetBloc();

  @override
  void initState() {
    _assetBloc.fetchAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetBloc(),
      child: BlocBuilder<AssetBloc, AssetsState>(
        bloc: _assetBloc,
        builder: (context, state) {
          if (state is AssetsLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is AssetsLoadedState) {
            return SearchField(
              onSearchTextChanged: widget.onSearchTextChanged,
              controller: widget.controller,
              searchInputDecoration: const InputDecoration(
                label: Text("Asset"),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(),
              ),
              suggestions: state.assets
                  .map(
                    (e) => SearchFieldListItem(
                      "${e.assetName?.capitalize()}",
                      item: e.id,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "${e.assetName}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onSuggestionTap: widget.onSuggestionTap,
              suggestionsDecoration: SuggestionDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 5, // blur radius
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              validator: (x) {
                final assets = state.assets
                    .map((e) => "${e.assetCode} - ${e.assetName?.capitalize()}")
                    .toList();
                print("Assets are : $assets");
                print("Asset field x is $x");

                if (x!.isEmpty || isNotContained(assets, x)) {
                  return 'Please Enter a Valid Asset';
                }
                return null;
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
