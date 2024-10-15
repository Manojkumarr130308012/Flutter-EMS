/* ------------------ Top Section ------------------ */

import 'package:flutter/material.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../2_workorder/presentation/view/workorder_page.dart';
import '../view/notification_page.dart';
import 'circle_avator_button.dart';

class HomeTop extends StatelessWidget {
  HomeTop({
    super.key,
  });
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        height: 120,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatorButton(
              icon: Icons.qr_code_scanner_outlined,
              onPress: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                if (res is String) {
                  print("resuuuult${res}");
                  result = res;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WorkOrdersPage(result: result);
                  }));
                }
              },
              label: context.local.scan,
            ),
            CircleAvatorButton(
              show: true,
              icon: Icons.notifications_none_sharp,
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(), // Navigate to NotificationPage
                  ),
                );
              },
              label: context.local.notification,
            ),
          ],
        ),
      ),
    );
  }
}
