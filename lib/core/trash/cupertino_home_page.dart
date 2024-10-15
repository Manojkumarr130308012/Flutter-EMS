// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
//
// import '../../../2_workorder/3_wo_presentation/view/wo_page.dart';
// import '../../../4_request/presentation/view/request_page.dart';
// import '../../../5_more/presentation/view/more_page.dart';
// import '../../../6_add/presentation/add_page.dart';
// import 'home_page.dart';
//
// class CupertinoHomePage extends StatelessWidget {
//   const CupertinoHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     PersistentTabController _controller;
//
//     _controller = PersistentTabController(initialIndex: 0);
//
//     List<Widget> _buildScreens() {
//       return [
//         HomePage(),
//         WorkOrdersPage(),
//         AddPage(),
//         RequestPage(),
//         MorePage()
//       ];
//     }
//
//     List<PersistentBottomNavBarItem> _navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: Icon(CupertinoIcons.home),
//           title: ("Home"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: Icon(CupertinoIcons.settings),
//           title: ("Settings"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: Icon(CupertinoIcons.settings),
//           title: ("Settings"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: Icon(CupertinoIcons.settings),
//           title: ("Settings"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: Icon(CupertinoIcons.settings),
//           title: ("Settings"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//       ];
//     }
//
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style1, // Choose the nav bar style with this property.
//     );
//   }
// }
