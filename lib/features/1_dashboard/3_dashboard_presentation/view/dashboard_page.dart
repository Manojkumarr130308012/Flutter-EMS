import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/features/settings/presentation/view/settings_page.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../2_workorder/presentation/view/workorder_page.dart';
import '../widgets/HomeBottom.dart';
import '../widgets/app_bar.dart';

/////////////////////////////////////////////////////////////
/// HOME PAGE
/////////////////////////////////////////////////////////////

/// Initial page after login. Displays the work orders count as per work order status.
class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final int _selectedIndex = 0;
  String result = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: OAppBar(
          titleCenter: false,
          icon: Icons.settings_outlined,
          qrIcon: Icons.qr_code_scanner_outlined,
          notificationIcon: Icons.notifications_none_sharp,
          title: context.local.appTitle,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const SettingsPage(),
              ),
            );
          },
          qrOnPress: () async {
            var res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SimpleBarcodeScannerPage(),
                ));
            if (res is String) {
              if (res == "-1") {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashBoardPage();
                }));
              } else {
                result = res;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WorkOrdersPage(result: result);
                }));
              }
            }
          },
          notificationOnPress: () {},
        ),
      ),
      // bottomNavigationBar: const BottomNavigationWidget(),
      body: Column(
        children: [
          /* ------------------  ------------------ */
          // HomeTop(), /* --- Added in Appbar--- */
          /* ------------------  ------------------ */
          dashboardHeader(context),
          /* ------------------  ------------------ */
          const DashBoardBottomWidget(),
        ],
      ),
    );
  }

  /* ----------------------------------------------------------------- */
  /*           )))))))))))))>> WIDGETS & METHOD <<((((((((((((( */
  /* ----------------------------------------------------------------- */

  Widget dashboardHeader(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Text(
              context.local.wo_dashboard,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          // const SizedBox(
          //   width: 50,
          // ),
          // TextButton(
          //   child: Text(context.local.edit),
          //   onPressed: () {
          //     buildShowCupertinoModalPopup(context);
          //   },
          // ),
        ],
      ),
    );
  }

  /* ------------------ buildShowCupertinoModalPopup ------------------ */

  Future<dynamic> buildShowCupertinoModalPopup(BuildContext context) {
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero)),
            child: CupertinoPopupSurface(
              child: Container(
                color: CupertinoColors.white,
                alignment: Alignment.center,
                width: double.infinity,
                height: 700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close),
                          ),
                          Text(
                            AppLocalizations.of(context)!.editDashboard,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        context.local.wo_populate,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text(context.local.all_wo),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        title: Text(context.local.custom),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ListTile(
                        title: Text(
                          context.local.include_work,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      ListTile(
                          title: Text(context.local.assigned_to_me),
                          trailing: CupertinoSwitch(
                            // This bool value toggles the switch.
                            value: true,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // // This is called when the user toggles the switch.
                              // setState(() {
                              //   light = value;
                              // });
                            },
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          context.local.assigned_to_my_team,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade600),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.arrow_forward_ios_outlined),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                          title: Text(context.local.unassigned),
                          trailing: CupertinoSwitch(
                            // This bool value toggles the switch.
                            value: false,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              // // This is called when the user toggles the switch.
                              // setState(() {
                              //   light = value;
                              // });
                            },
                          )),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
