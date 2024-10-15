// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
// import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
// import 'package:oriens_eam/features/1_dashboard/3_dashboard_presentation/widgets/app_bar.dart';
// import 'package:oriens_eam/features/2_workorder/2_wo_data/workorders.dart';
// import 'package:oriens_eam/features/2_workorder/3_wo_presentation/bloc/workorder_bloc.dart';
// import 'package:oriens_eam/features/2_workorder/3_wo_presentation/widgets/dropdown_filter_chip.dart';
// import 'package:oriens_eam/features/3_workorder_details/3_wod_presentation/view/wo_details_page.dart';
//
// /* ----------------------------------------------------------------- */
// /*           )))))))))))))>> WORK ORDER PAGE <<((((((((((((( */
// /* ----------------------------------------------------------------- */
//
// class WorkOrdersPage extends StatefulWidget {
//   const WorkOrdersPage({super.key});
//
//   @override
//   State<WorkOrdersPage> createState() => _WorkOrdersPageState();
// }
//
// class _WorkOrdersPageState extends State<WorkOrdersPage> {
//   final WorkOrderBloc _bloc = WorkOrderBloc();
//
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   String selectedOptions = "Option 1";
//   bool isSelected = true;
//
//   List<String> sortOptions = ["My Work", "Due Date", "Open", "All Status", "Priority"];
//
//   // Define selected categories as a ValueNotifier
//   final selectedCategories = ValueNotifier<Set<String>>({});
//
//   // Define a library object with categories
//   final library = Library(
//     categories: ['Category 1', 'Category 2', 'Category 3', 'Category 4'],
//   );
//
//   List<CheckBoxListTileModel> checkBoxListTileModel = CheckBoxListTileModel.getUsers();
//
//   void itemChange(bool val, int index) {
//     setState(() {
//       checkBoxListTileModel[index].isCheck = val;
//     });
//   }
//
//   /* ------------------ BUILD METHOD ------------------ */
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(240),
//         child: Material(
//           elevation: 4,
//           child: Container(
//             decoration: const BoxDecoration(),
//             child: Column(
//               children: [
//                 OAppBar(
//                   title: context.local.work_orders,
//                   leadingIcon: IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new_outlined,
//                     ),
//                     onPressed: () {
//                       context.go("/home");
//                     },
//                   ),
//                   icon: Icons.calendar_today_outlined,
//                   onPress: () {
//                     context.go('/home/workorder/calender');
//                   },
//                 ),
//
//                 /* ------------------ 1_Search Field ------------------ */
//
//                 const SearchField(),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 /* ------------------ 2_Filters Section ------------------ */
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 4,
//                     bottom: 4,
//                     left: 8,
//                     right: 0,
//                   ),
//                   child: Filterchips(
//                       label: Text(context.local.choose),
//                       sortOptions: sortOptions,
//                       selectedCategories: selectedCategories,
//                       library: library),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 /* ------------------ Sort By Section ------------------ */
//
//                 SortBySection(checkBoxListTileModel: checkBoxListTileModel),
//                 const SizedBox(height: 5),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       /* ------------------ Body ------------------ */
//
//       body: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Column(
//           children: [
//             /* ------------------ Work Order List Section------------------ */
//
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   await _bloc.getData();
//                 },
//                 child: StreamBuilder(
//                   stream: _bloc.stream,
//                   builder: (BuildContext context, AsyncSnapshot<List<WorkOrder>> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Align(
//                           alignment: Alignment.topCenter, child: CupertinoActivityIndicator());
//                     } else {
//                       List<WorkOrder>? workOrders = snapshot.data;
//
//                       return ListView.separated(
//                           itemCount: workOrders!.length,
//                           // The list items
//                           itemBuilder: (context, index) {
//                             var workOrder = workOrders[index];
//                             String? priority;
//                             if (workOrder.priorityName!.isNotEmpty) {
//                               priority = workOrder.priorityName?.substring(0, 6);
//                             } else {
//                               priority = "";
//                             }
//                             return SizedBox(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     /* ------------------ Status, WO No. Priority ------------------ */
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         /* ------------------ Status ------------------ */
//
//                                         Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.green,
//                                               borderRadius: BorderRadius.circular(10)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 vertical: 1.5, horizontal: 6),
//                                             child: Text(workOrder.status ?? "",
//                                                 style: const TextStyle(color: Colors.white)),
//                                           ),
//                                         ),
//
//                                         /* ------------------ WO No. & Priority ------------------ */
//
//                                         Row(
//                                           children: [
//                                             /* ------------------ WO No. ------------------ */
//
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   color: Colors.grey.shade300,
//                                                   borderRadius: BorderRadius.circular(3)),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.symmetric(
//                                                     vertical: 1.5, horizontal: 6),
//                                                 child: Text(
//                                                   "#${workOrder.workOrderCode?.trim()}",
//                                                   style: TextStyle(color: Colors.grey.shade600),
//                                                 ),
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 5,
//                                             ),
//
//                                             /* ------------------ Priority ------------------ */
//
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                 color: Colors.grey.shade300,
//                                                 borderRadius: BorderRadius.circular(3),
//                                               ),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.symmetric(
//                                                     vertical: 1.5, horizontal: 6),
//                                                 child: Text(
//                                                   overflow: TextOverflow.ellipsis,
//                                                   softWrap: false,
//                                                   priority!,
//                                                   style: const TextStyle(color: Colors.blue),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//
//                                     /* ------------------ Work Tile ------------------ */
//
//                                     Text(
//                                       workOrder.workOrderName ?? "",
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//
//                                     /* ------------------ Other Details - First Line ------------------ */
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Icon(
//                                           size: 18,
//                                           Icons.check_circle_outline_rounded,
//                                           color: Colors.grey.shade400,
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           // DateFormat.yMMMEd().format(workOrder.plannedEndDate)
//                                           DateFormat.yMMMd().format(workOrder.plannedEndDate!),
//                                           style: const TextStyle(color: Colors.blue),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//
//                                     /* ------------------ Other Details - Second Line ------------------ */
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Icon(
//                                           size: 18,
//                                           Icons.approval_outlined,
//                                           color: Colors.grey.shade400,
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           workOrder.locationName ?? "",
//                                           style: TextStyle(color: Colors.grey.shade400),
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//
//                                     /* ------------------ Other Details - Third Line ------------------ */
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Icon(
//                                           size: 18,
//                                           Icons.token_rounded,
//                                           color: Colors.grey.shade400,
//                                         ),
//                                         const SizedBox(
//                                           width: 10,
//                                         ),
//                                         Text(
//                                           workOrder.assetName ?? "",
//                                           style: TextStyle(color: Colors.grey.shade400),
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 8,
//                                     ),
//
//                                     /* ------------------ Other Details - Last Line ------------------ */
//
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             Icon(
//                                               size: 18,
//                                               Icons.person_outline_rounded,
//                                               color: Colors.grey.shade400,
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   color: Colors.grey.shade300,
//                                                   borderRadius: BorderRadius.circular(3)),
//                                               child: Padding(
//                                                 padding: const EdgeInsets.symmetric(
//                                                     vertical: 1.5, horizontal: 6),
//                                                 child: Text("Me",
//                                                     style: TextStyle(color: Colors.grey.shade400)),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//
//                                         /* ------------------ Bookmark And More  ------------------ */
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.start,
//                                           children: [
//                                             InkWell(
//                                               child: Icon(
//                                                 size: 18,
//                                                 Icons.bookmark_border_outlined,
//                                                 color: Colors.grey.shade400,
//                                               ),
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             ),
//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) => WorkorderDetailsPage(
//                                                         workOrder: workOrders[index]),
//                                                   ),
//                                                 );
//                                               },
//                                               child: Icon(
//                                                 size: 18,
//                                                 Icons.more_horiz_rounded,
//                                                 color: Colors.grey.shade400,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                           // The separators
//                           separatorBuilder: (context, index) {
//                             return Divider(
//                               thickness: 3,
//                               color: Colors.grey.shade300,
//                             );
//                           });
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /* ----------------------------------------------------------------- */
// /*   )))))))))))))>> WIDGETS OF WORK ORDER PAGE  <<((((((((((((( */
// /* ----------------------------------------------------------------- */
//
// /* ------------------ SORT BY SECTION ------------------ */
//
// class SortBySection extends StatelessWidget {
//   SortBySection({
//     super.key,
//     required this.checkBoxListTileModel,
//   });
//
//   final List<CheckBoxListTileModel> checkBoxListTileModel;
//   final WorkOrderBloc _bloc = WorkOrderBloc();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   // BOTTOM SHEET
//                   buildShowModalBottomSheet(context);
//                 },
//                 child: const Icon(Icons.sort_outlined),
//               ),
//               const SizedBox(
//                 width: 5,
//               ),
//               Text(context.local.status)
//             ],
//           ),
//           StreamBuilder(
//               stream: _bloc.stream,
//               builder: (context, snapshot) {
//                 List<WorkOrder>? workOrders = snapshot.data;
//                 if (!snapshot.hasData) {
//                   return const Align(
//                       alignment: Alignment.topCenter, child: CupertinoActivityIndicator());
//                 } else {
//                   return Text(" ${workOrders?.length} Results");
//                 }
//               })
//         ],
//       ),
//     );
//   }
//
//   ///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\
//
//   Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.0),
//         ),
//         builder: (BuildContext context) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * .68,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 6,
//                   ),
//                   Center(
//                     child: Container(
//                       height: 3,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                     child: Text(
//                       context.local.sort_by,
//                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                   ),
//
//                   /* ------------------ List View ------------------ */
//
//                   Expanded(
//                     child: ListView.separated(
//                         itemCount: checkBoxListTileModel.length,
//                         separatorBuilder: (BuildContext context, int index) {
//                           return const Divider();
//                         },
//                         itemBuilder: (BuildContext context, int index) {
//                           return SizedBox(
//                             height: 35,
//                             child: Center(
//                               child: ListTile(
//                                 titleAlignment: ListTileTitleAlignment.center,
//                                 title: Text(
//                                   checkBoxListTileModel[index].title,
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       // fontWeight:
//                                       //     FontWeight
//                                       //         .w600,
//                                       letterSpacing: 0.5),
//                                 ),
//                                 trailing: checkBoxListTileModel[index].isCheck
//                                     ? const Icon(
//                                         Icons.check,
//                                         color: Colors.blue,
//                                       )
//                                     : null,
//                                 selectedColor: Colors.blue,
//                                 onTap: () {},
//                                 onLongPress: () {},
//                               ),
//                             ),
//                             // CheckboxListTile(
//                             //     activeColor: Colors.pink[300],
//                             //     dense: true,
//                             //     //font change
//                             //     title:  Text(
//                             //       checkBoxListTileModel[index].title,
//                             //       style: const TextStyle(
//                             //           fontSize: 14,
//                             //           fontWeight: FontWeight.w600,
//                             //           letterSpacing: 0.5),
//                             //     ),
//                             //     value: checkBoxListTileModel[index].isCheck,
//                             //
//                             //     onChanged: (bool? val) => itemChange(val!, index)),
//                           );
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
//
// /* ------------------ SEARCH FIELD ------------------ */
//
// class SearchField extends StatelessWidget {
//   const SearchField({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       child: TextField(
//         decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey.shade200,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.0),
//               borderSide: BorderSide.none,
//             ),
//             isDense: true, // Added this
//             contentPadding: const EdgeInsets.all(8),
//             hintText: context.local.search_by,
//             hintStyle: TextStyle(color: Colors.grey.shade500),
//             prefixIcon: const Icon(
//               Icons.search,
//               size: 30,
//             ),
//             prefixIconColor: Colors.grey.shade400),
//       ),
//     );
//   }
// }
//
// /* ------------------ FILTER CHIPS ------------------ */
//
// class Filterchips extends StatelessWidget {
//   const Filterchips(
//       {Key? key,
//       this.isNeedDropdown = false,
//       required this.sortOptions,
//       required this.selectedCategories,
//       required this.library,
//       this.label})
//       : super(key: key);
//   final bool isNeedDropdown;
//   final List<String> sortOptions;
//   final ValueNotifier<Set<String>> selectedCategories;
//   final Library library;
//   final Widget? label;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 55,
//       // width: MediaQuery.of(context).size.width,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: Colors.grey.shade200,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.filter_list,
//                 color: Colors.black,
//               ),
//               onPressed: () {},
//             ),
//           ),
//           const Visibility(
//             visible: false,
//             child: Positioned(
//               // draw a red marble
//               top: 0.0,
//               right: 5.0,
//               child: Icon(Icons.brightness_1, size: 10.0, color: Colors.redAccent),
//             ),
//           ),
//           const VerticalDivider(
//             indent: 8,
//             endIndent: 8,
//             color: Colors.grey,
//           ),
//           Flexible(
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: sortOptions.length,
//               itemBuilder: (BuildContext context, int index) {
//                 /* ------------------ Filter  Chips ------------------ */
//
//                 return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: isNeedDropdown
//                         ? FilterChipWithDropDown<String>(
//                             label: Text(
//                               selectedCategories.value.isEmpty
//                                   ? 'Category'
//                                   : selectedCategories.value.first,
//                             ),
//                             value: selectedCategories.value.isEmpty
//                                 ? null
//                                 : selectedCategories.value.first,
//                             items: [
//                               const DropdownMenuItem(value: null, child: Text('all')),
//                               for (final category in library.categories)
//                                 DropdownMenuItem(value: category, child: Text(category)),
//                             ],
//                             onChanged: (category) {
//                               selectedCategories.value = {if (category != null) category};
//                             },
//                           )
//                         : FilterChipWithOutDropdown(label: Text(sortOptions[index])));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /* ------------------ OTHER HELPERS ------------------ */
//
// class Library {
//   final List<String> categories;
//
//   Library({required this.categories});
// }
//
// class CheckBoxListTileModel {
//   String title;
//   bool isCheck;
//   CheckBoxListTileModel({required this.title, required this.isCheck});
//
//   static List<CheckBoxListTileModel> getUsers() {
//     return <CheckBoxListTileModel>[
//       CheckBoxListTileModel(title: "Due Date", isCheck: false),
//       CheckBoxListTileModel(title: "Status", isCheck: true),
//       CheckBoxListTileModel(title: "Last Updated", isCheck: false),
//       CheckBoxListTileModel(title: "Newest", isCheck: false),
//       CheckBoxListTileModel(title: "Oldest", isCheck: false),
//       CheckBoxListTileModel(title: "Primary Worker", isCheck: false),
//       CheckBoxListTileModel(title: "Location", isCheck: false),
//       CheckBoxListTileModel(title: "Priority", isCheck: false),
//       CheckBoxListTileModel(title: "Team", isCheck: false),
//       CheckBoxListTileModel(title: "Asset", isCheck: false),
//     ];
//   }
// }
//
// class StreamBuilderWidget extends StatefulWidget {
//   const StreamBuilderWidget({super.key});
//
//   @override
//   State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
// }
//
// class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
//   final WorkOrderBloc _bloc = WorkOrderBloc();
//   @override
//   void dispose() {
//     _bloc.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: _bloc.stream,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             List<WorkOrder> workOrders = snapshot.data;
//             return Text("${workOrders[0].assetName}");
//           } else {
//             return const CircularProgressIndicator();
//           }
//         });
//   }
// }

/////////////////////////// QR CODE SCANNER UI \\\\\\\\\\\\\\\\\\\\\\\\\\
// Container(
//   decoration: BoxDecoration(
//     color: Colors.grey,
//     borderRadius: BorderRadius.circular(15),
//   ),
//   height: 100,
//   width: 100,
//   child: MobileScanner(
//     scanWindow: Rect.fromCenter(
//       center: MediaQuery.of(context).size.center(Offset.zero),
//       width: 100,
//       height: 100,
//     ),
//     onDetect: (BarcodeCapture barcodes) {
//       setState(() {
//         barcode = barcodes;
//         assetController.text =
//             barcode?.barcodes.first.displayValue ?? "";
//       });
//       print(barcode?.barcodes.first.displayValue);
//     },
//   ),
// ),
