import 'package:flutter/material.dart';

import '../../../2_workorder/3_wo_presentation/view/calender_page.dart';

class AssetSortByWidget extends StatelessWidget {
  const AssetSortByWidget({
    super.key,
    required this.checkBoxListTileModel,
    required this.results,
  });

  final List<CheckBoxListTileModel> checkBoxListTileModel;
  final String results;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // BOTTOM SHEET
                  // buildShowModalBottomSheet(context);
                },
                child: const Icon(Icons.sort_outlined),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Newest")
            ],
          ),
          Text(results)
        ],
      ),
    );
  }
}
