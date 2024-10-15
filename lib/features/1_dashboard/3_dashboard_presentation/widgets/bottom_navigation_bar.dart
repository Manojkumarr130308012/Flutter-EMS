// class ONavigationBar extends StatefulWidget {
//   const ONavigationBar({super.key});
//
//   @override
//   State<ONavigationBar> createState() => _ONavigationBarState();
// }
//
// class _ONavigationBarState extends State<ONavigationBar> {
//   int _selectedIndex = 0;
//   List<Widget> pages = const [];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4.0,
//             // offset: Offset(0.0, 0.75),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         currentIndex: _selectedIndex,
//         items: [
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.content_paste_outlined),
//             label: "Work Orders",
//           ),
//           BottomNavigationBarItem(
//             icon: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade200, shape: BoxShape.circle),
//                 padding: const EdgeInsets.all(10),
//                 child: const Icon(Icons.add, color: Colors.black54),
//               ),
//             ),
//             label: "",
//             backgroundColor: Colors.grey.shade400,
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.inbox_outlined),
//             label: "Requests",
//           ),
//           const BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: "More",
//           ),
//         ],
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////////
///
/////////////////////////////////////////////////////////////

// class BottomNavigationWidget extends StatefulWidget {
//   const BottomNavigationWidget({super.key});
//
//   @override
//   State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
// }
//
// class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//   @override
//   Widget build(BuildContext context) {
//     int position = 0;
//     void _onTab(int index) {
//       setState(() {
//         position = index;
//       });
//       switch (index) {
//         case 0:
//           context.go('/');
//           break;
//         case 1:
//           context.push('/work_order');
//           break;
//         case 2:
//           context.push('/add');
//           break;
//         case 3:
//           context.push('/request');
//           break;
//         case 4:
//           context.push('/more');
//           break;
//         default:
//       }
//     }
//
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 4.0,
//             // offset: Offset(0.0, 0.75),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: position,
//           onTap: (value) {
//             _onTab(value);
//           },
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
//           ]),
//     );
//   }
// }
