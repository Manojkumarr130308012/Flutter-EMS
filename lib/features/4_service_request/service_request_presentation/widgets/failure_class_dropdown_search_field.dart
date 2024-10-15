import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/9_failure/failure_presentaion/bloc/failure_class/failure_class_bloc.dart';
import 'package:searchfield/searchfield.dart';

import '../../../../core/utils/methods.dart';

class FailureClassDropDownSearchField extends StatefulWidget {
  final TextEditingController controller;

  final dynamic Function(SearchFieldListItem<String>) onSuggestionTap;
  final dynamic Function(String)? onChanged;

  const FailureClassDropDownSearchField({
    super.key,
    required this.controller,
    required this.onSuggestionTap,
    required this.onChanged,
  });

  @override
  State<FailureClassDropDownSearchField> createState() => _FailureClassDropDownSearchFieldState();
}

class _FailureClassDropDownSearchFieldState extends State<FailureClassDropDownSearchField> {
  final FailureClassBloc _failureClassBloc = FailureClassBloc();
  @override
  void initState() {
    _failureClassBloc.fetchFailureClass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FailureClassBloc(),
      child: BlocBuilder<FailureClassBloc, FailureClassState>(
        bloc: _failureClassBloc,
        builder: (context, state) {
          if (state is FailureClassLoadingState) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is FailureClassLoadedState) {
            return SearchField(
              controller: widget.controller,
              textInputAction: TextInputAction.done,
              searchInputDecoration: const InputDecoration(
                label: Text("Failure Class"),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(),
              ),
              suggestions: state.failureClass
                  .map(
                    (e) => SearchFieldListItem(
                      e.failureClassName ?? "",
                      item: e.id,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          e.failureClassName ?? "",
                          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.blue),
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
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              onSubmit: widget.onChanged,
              validator: (x) {
                final fci = state.failureClass.map((e) => e.failureClassName).toList();
                if (x!.isEmpty || isNotContained(fci, x)) {
                  return 'Please Enter a Failure Class';
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
