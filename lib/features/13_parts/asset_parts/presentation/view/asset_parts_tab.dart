import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/13_parts/asset_parts/presentation/bloc/asset_parts_bloc.dart';

class AssetPartsTab extends StatelessWidget {
  const AssetPartsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetPartsBloc, AssetFileState>(
      builder: (context, state) {
        if (state is AssetPartsLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is AssetPartsErrorState) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is AssetPartsLoadedState) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(" ${state.assetParts.length} Results"),
                  ],
                ),
              ),
              const Divider(),
              Flexible(
                child: state.assetParts.isEmpty
                    ? const Center(child: Text(" No Parts for the Asset"))
                    : ListView.separated(
                        // shrinkWrap: true,
                        itemCount: state.assetParts.length,
                        // The list items
                        itemBuilder: (context, index) {
                          var assetParts = state.assetParts[index];
                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      /* ------------------ Status ------------------ */
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 1.5, horizontal: 6),
                                          child: Text(assetParts.partStatus ?? "",
                                              style: const TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                                borderRadius: BorderRadius.circular(3)),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 1.5, horizontal: 6),
                                              child: Text(
                                                "#${assetParts.partCode?.trim()}",
                                                style: TextStyle(color: Colors.grey.shade600),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    assetParts.partName ?? "",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  /* ------------------ Other Details - First Line ------------------ */

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        size: 18,
                                        Icons.info_outline,
                                        color: Colors.grey.shade400,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        assetParts.partDescription == ""
                                            ? " No Description Available"
                                            : assetParts.partDescription ?? "",
                                        style: const TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),

                                  /* ------------------ Other Details - Second Line ------------------ */

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        size: 18,
                                        Icons.numbers_outlined,
                                        color: Colors.grey.shade400,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${assetParts.partQuantity}",
                                        style: const TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        // The separators
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 3,
                            color: Colors.grey.shade300,
                          );
                        }),
              ),
            ],
          );
        }
        return const Center(child: Text(" No Parts for the Asset"));
      },
    );
  }
}
