// import 'package:flutter/material.dart';
// import 'package:oriens_eam/features/1_dashboard/3_dashboard_presentation/view/home_page.dart';
// import 'package:oriens_eam/features/2_workorder/3_wo_presentation/view/wo_page.dart';
// import 'package:oriens_eam/features/4_request/presentation/view/request_page.dart';
// import 'package:oriens_eam/features/5_more/presentation/view/more_page.dart';
// import 'package:oriens_eam/features/6_add/presentation/add_page.dart';
//
// class DashBoard extends StatefulWidget {
//   static const routeName = "/dashboard";
//   const DashBoard({super.key});
//
//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }
//
// class _DashBoardState extends State<DashBoard> {
//   int _selectedIndex = 0;
//   List<Widget> pages = const [
//     HomePage(),
//     WorkOrdersPage(),
//     AddPage(),
//     RequestPage(),
//     MorePage()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       // appBar: PreferredSize(
//       //   preferredSize: const Size.fromHeight(60),
//       //   child: OAppBar(
//       //     titleCenter: false,
//       //     icon: Icons.settings_outlined,
//       //     title: context.local.appTitle,
//       //     onPress: () {
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(
//       //           builder: (BuildContext context) => const SettingsPage(),
//       //         ),
//       //       );
//       //     },
//       //   ),
//       // ),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 4.0,
//               // offset: Offset(0.0, 0.75),
//             ),
//           ],
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           showUnselectedLabels: true,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           currentIndex: _selectedIndex,
//           items: [
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.content_paste_outlined),
//               label: "Work Orders",
//             ),
//             BottomNavigationBarItem(
//               icon: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: Colors.grey.shade200, shape: BoxShape.circle),
//                   padding: const EdgeInsets.all(10),
//                   child: const Icon(Icons.add, color: Colors.black54),
//                 ),
//               ),
//               label: "",
//               backgroundColor: Colors.grey.shade400,
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.inbox_outlined),
//               label: "Requests",
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.menu),
//               label: "More",
//             ),
//           ],
//         ),
//       ),
//       body: pages[_selectedIndex],
//     );
//   }
// }

/////////////////////////// Stream Builder \\\\\\\\\\\\\\\\\\\\\\\\\\

// StreamBuilder<List<WorkOrder>>(
//     stream: _bloc.stream,
//     builder: (
//       context,
//       snapshot,
//     ) {
//       if (!snapshot.hasData) {
//         return const Align(
//             alignment: Alignment.center, child: CupertinoActivityIndicator());
//       } else {
//         statusMap["All Pending"] = snapshot.data
//             ?.where((element) => element.status != "Completed")
//             .length;
//         statusMap["Open"] =
//             snapshot.data?.where((element) => element.status == "NEW").length;
//         statusMap["In Progress"] =
//             snapshot.data?.where((element) => element.status == "INPRG").length;
//         statusMap["Stop"] =
//             snapshot.data?.where((element) => element.status == "STP").length;
//         statusMap["Past Due"] = snapshot.data
//             ?.where(
//                 (element) => element.targetEndDate == DateTime.now().toString())
//             .length;
//         statusMap["Completed"] = snapshot.data
//             ?.where((element) => element.targetEndDate == "COMP")
//             .length;
//         List<int?> counts = statusMap.values.toList();
//         return Text(counts[index].toString());
//       }
//     }),
