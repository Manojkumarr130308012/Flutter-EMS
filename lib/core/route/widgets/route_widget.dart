import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Work Order',
            icon: Icon(Icons.settings),
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.add,
          //     color: Colors.black54,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     buildShowCupertinoModalPopup();
          //   },
          // ),
          NavigationDestination(
            label: 'Requests',
            icon: Icon(Icons.inbox_outlined),
          ),
          NavigationDestination(
            label: 'More',
            icon: Icon(Icons.menu_outlined),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }

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
                            context.local.editDashboard,
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
