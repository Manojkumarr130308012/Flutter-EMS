// import 'package:flutter/cupertino.dart';
//
// class EditDashBoardPage extends StatefulWidget {
//   static const routeName = "/edit_dashboard";
//   const EditDashBoardPage({super.key});
//
//   @override
//   State<EditDashBoardPage> createState() => _EditDashBoardPageState();
// }
//
// class _EditDashBoardPageState extends State<EditDashBoardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MyHomePage();
//
//   }
// }
//
//
//
// class MyHomePage extends StatelessWidget {
//   void _showModal(BuildContext context) {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoFullscreenDialogTransition(
//           primaryRouteAnimation: AlwaysStoppedAnimation(1),
//           secondaryRouteAnimation: AlwaysStoppedAnimation(1),
//           linearTransition: false,
//           child: Container(
//             color: CupertinoColors.systemBackground,
//             height: MediaQuery.of(context).size.height * 0.8, // Adjust height as needed
//             child: Column(
//               children: <Widget>[
//                 CupertinoNavigationBar(
//                   middle: Text('Full-Width Modal'),
//                   leading: CupertinoButton(
//                     child: Text('Close'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: Center(
//                     child: Text('Content goes here'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text('Full-Width Modal Example'),
//       ),
//       child: Center(
//         child: CupertinoButton(
//           child: Text('Show Modal'),
//           onPressed: () {
//             _showModal(context);
//           },
//         ),
//       ),
//     );
//   }
// }
