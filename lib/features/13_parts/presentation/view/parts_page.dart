import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../4_service_request/service_request_presentation/widgets/appbar_search_filed.dart';

class PartsPage extends StatefulWidget {
  const PartsPage({super.key});

  @override
  State<PartsPage> createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170),
        child: Material(
          elevation: 2,
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'Parts Inventory',
                    style: TextStyle(color: Colors.black),
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

                const AppBarSearchField(title: "Search all Parts"),
                const SizedBox(
                  height: 10,
                ),
                /* ------------------ Sort By Section ------------------ */

                // BlocBuilder<AssetBloc, AssetsState>(
                //   bloc: _bloc,
                //   builder: (context, state) {
                //     if (state is AssetsLoadingState) {
                //       return const Center(
                //         child: CupertinoActivityIndicator(),
                //       );
                //     }
                //     if (state is AssetsLoadedState) {
                //       return AssetSortByWidget(
                //         checkBoxListTileModel: checkBoxListTileModel,
                //         results: state.assets.length > 1
                //             ? " ${state.assets.length} Results"
                //             : " ${state.assets.length} Result",
                //       );
                //     }
                //     return Container();
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text("Parts Inventory"),
      ),
    );
  }
}
