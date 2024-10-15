import 'package:flutter/material.dart';
import 'package:oriens_eam/features/3_workorder_details/3_wod_presentation/widgets/build_List_tile_methods.dart';

import '../../../2_workorder/domain/entities/workorder.dart';
import 'asset_details_richtext.dart';

class AssetDetailsTab extends StatelessWidget {
  const AssetDetailsTab({
    super.key,
    required this.workOrder,
  });

  final WorkorderEntity workOrder;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const Divider(),
        buildListTile2(
          heading: workOrder.assetName ?? "",
          subtitle: workOrder.description ?? "",
          icon: null,
        ),
        // const Divider(
        //   thickness: 1,
        //   color: Colors.grey,
        // ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey.shade300),
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        /*|----------------------- 1 -----------------------|*/

        const AssetDetailsRichText(
          heading: "Model ",
          detail: " TRANE 4TTR7024A1000B",
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: .5,
          ),
        ),

        /*|----------------------- 2 -----------------------|*/

        const AssetDetailsRichText(
          heading: "Barcode",
          detail: " 37828494569",
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: .5,
          ),
        ),

        /*|----------------------- 3 -----------------------|*/

        const AssetDetailsRichText(
          heading: "Location",
          detail: ''' SuiteB 10880 wilsshire Blvd, Los Angels,
                CA 90024, USA ''',
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: .5,
          ),
        ),

        /*|----------------------- 4 -----------------------|*/

        const AssetDetailsRichText(
          heading: "Area",
          detail: " Suite B",
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: .5,
          ),
        ),

        /*|----------------------- 5 -----------------------|*/

        const AssetDetailsRichText(
          heading: "Assigned To",
          detail: " Rajkumar Pillai",
        ),
        const Divider(
          thickness: .5,
        ),
        SizedBox(
          height: 50,
          child: Text(
            "Additional Information",
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey.shade300),
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
            ),
          ),
        ),
        ListTile(
          leading: TextButton(
            onPressed: () {},
            child: const Text(
              'Add Sub Asset',
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {},
          ),
        ),

        Container(
          height: 10,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border(
              top: BorderSide(width: 1.0, color: Colors.grey.shade300),
              bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
            ),
          ),
        ),
        ListTile(
          title: TextButton(
            onPressed: () {},
            child: const Text(
              'Add To New Work Order',
            ),
          ),
        ),
      ],
    );
  }
}
