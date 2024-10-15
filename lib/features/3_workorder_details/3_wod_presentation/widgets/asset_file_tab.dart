import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../7_assets/asset_files/presentation/bloc/asset_file_bloc.dart';
import 'asset_file_view.dart';

class AssetFilesTab extends StatelessWidget {
  const AssetFilesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetFileBloc, AssetFileState>(
      builder: (context, state) {
        if (state is AssetFileLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is AssetFileErrorState) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is AssetFileLoadedState) {
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
                    Text(" ${state.assetFiles.length} Results"),
                  ],
                ),
              ),
              const Divider(),
              Flexible(
                child: state.assetFiles.isEmpty
                    ? const Center(child: Text(" No Files for the Asset"))
                    : ListView.separated(
                        // shrinkWrap: true,
                        itemCount: state.assetFiles.length,
                        // The list items
                        itemBuilder: (context, index) {
                          var assetFile = state.assetFiles[index];
                          return Container(
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 1.5, horizontal: 6),
                                          child: Text(assetFile.documenttype ?? "",
                                              style: const TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        assetFile.documentcategory ?? "",
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) => AssetFileView(
                                                  filePath: assetFile.documentName ?? "",
                                                  documentType: assetFile.documentcategory ?? "",
                                                )),
                                      );
                                    },
                                    child: Container(
                                      height: 65,
                                      width: 65,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          shape: BoxShape.rectangle,
                                          border: Border.all(color: Colors.grey.shade200),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: const Center(
                                        child: Text(
                                          "File Preview",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
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
        return const Center(child: Text(" No Files for the Asset"));
      },
    );
  }
}
