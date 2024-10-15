import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: Container(
        height: 65,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              // offset: Offset(0.0, 0.75),
            ),
          ],
        ),
        child: NavigationBar(
          indicatorShape: const CircleBorder(),
          backgroundColor: Colors.white,
          elevation: 4,
          selectedIndex: selectedIndex,
          destinations: const [
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            ),
            NavigationDestination(
              label: 'WorkOrder',
              icon: Icon(Icons.content_paste_outlined),
              selectedIcon: Icon(
                Icons.content_paste_outlined,
                color: Colors.blue,
              ),
            ),
            // NavigationDestination(
            //   label: '',
            //   icon: Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey.shade300, shape: BoxShape.circle),
            //       padding: const EdgeInsets.all(10),
            //       child: const Icon(
            //         Icons.add,
            //         color: Colors.black54,
            //       ),
            //     ),
            //   ),
            //   selectedIcon: Align(
            //     alignment: Alignment.center,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.blue.shade100, shape: BoxShape.circle),
            //       padding: const EdgeInsets.all(10),
            //       child: const Icon(
            //         Icons.add,
            //         color: Colors.blue,
            //       ),
            //     ),
            //   ),
            // ),
            NavigationDestination(
              label: 'Request',
              icon: Icon(Icons.inbox_outlined),
              selectedIcon: Icon(
                Icons.inbox_outlined,
                color: Colors.blue,
              ),
            ),
            NavigationDestination(label: 'More', icon: Icon(Icons.menu)),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}
