import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/features/4_service_request/service_request_presentation/widgets/appbar_search_filed.dart';
import 'package:oriens_eam/features/7_assets/presentation/bloc/asset_cubit.dart';
import 'package:oriens_eam/features/7_assets/presentation/widgets/asset_sort_by_widget.dart';

import '../../../2_workorder/3_wo_presentation/view/calender_page.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key});

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  List<CheckBoxListTileModel> checkBoxListTileModel = CheckBoxListTileModel.getUsers();

  final AssetBloc _bloc = AssetBloc();

  @override
  void initState() {
    _bloc.fetchAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AssetBloc(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(170),
          child: Material(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      context.local.assets,
                      style: const TextStyle(color: Colors.black),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),

                  /* ------------------ 1_Search Field ------------------ */

                  const AppBarSearchField(title: "Search all Assets"),
                  const SizedBox(
                    height: 10,
                  ),
                  /* ------------------ Sort By Section ------------------ */

                  BlocBuilder<AssetBloc, AssetsState>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is AssetsLoadingState) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      if (state is AssetsLoadedState) {
                        return AssetSortByWidget(
                          checkBoxListTileModel: checkBoxListTileModel,
                          results: state.assets.length > 1
                              ? " ${state.assets.length} Results"
                              : " ${state.assets.length} Result",
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: BlocConsumer<AssetBloc, AssetsState>(
          bloc: _bloc,
          listener: (BuildContext context, AssetsState state) {
            if (state is AssetsErrorState) {
              SnackBar snackBar = SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (BuildContext context, state) {
            if (state is AssetsLoadingState) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state is AssetsLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    /////////////////////////// SERVICE REQUEST LISTS \\\\\\\\\\\\\\\\\\\\\\\\\\
                    Expanded(
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: state.assets.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(4),
                              semanticContainer: false,
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    /////////////////////////// SERVICE REQUEST TITLE \\\\\\\\\\\\\\\\\\\\\\\\\\
                                    Text(
                                      state.assets[index].assetName ?? "",
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.qr_code_2_outlined,
                                          color: Colors.grey.shade600,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          state.assets[index].assetCode ?? "AssetCode",
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey.shade600,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          state.assets[index].locationName ?? "Location",
                                          style: TextStyle(color: Colors.grey.shade600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: Text("An error Occurred!"),
            );
          },
        ),
      ),
    );
  }
}
