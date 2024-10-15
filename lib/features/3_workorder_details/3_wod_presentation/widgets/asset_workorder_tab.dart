import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';

import '../../../3_1_asset_workorder/presentation/bloc/asset_work_order_bloc.dart';

class AssetWorkOrderTab extends StatelessWidget {
  const AssetWorkOrderTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetWorkOrderBloc, AssetWorkOrderState>(
      builder: (context, state) {
        if (state is AssetWorkOrderLoadingState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is AssetWorkOrderErrorState) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is AssetWorkOrderLoadedState) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // BOTTOM SHEET
                            // buildShowModalBottomSheet(context);
                          },
                          child: const Icon(Icons.sort_outlined),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(context.local.status)
                      ],
                    ),
                    Text(" ${state.workOrders.length} Results"),
                  ],
                ),
              ),
              const Divider(),
              Flexible(
                child: ListView.separated(
                    // shrinkWrap: true,
                    itemCount: state.workOrders.length,
                    // The list items
                    itemBuilder: (context, index) {
                      var workOrder = state.workOrders[index];
                      String? priority;
                      if (workOrder.priorityName!.isNotEmpty) {
                        priority = workOrder.priorityName?.substring(0, 6);
                      } else {
                        priority = "";
                      }
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* ------------------ Status, WO No. Priority ------------------ */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /* ------------------ Status ------------------ */
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 1.5, horizontal: 6),
                                      child: Text(workOrder.status ?? "",
                                          style: const TextStyle(color: Colors.white)),
                                    ),
                                  ),

                                  /* ------------------ WO No. & Priority ------------------ */
                                  Row(
                                    children: [
                                      /* ------------------ WO No. ------------------ */
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius: BorderRadius.circular(3)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 1.5, horizontal: 6),
                                          child: Text(
                                            "#${workOrder.workOrderCode?.trim()}",
                                            style: TextStyle(color: Colors.grey.shade600),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),

                                      /* ------------------ Priority ------------------ */

                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 1.5, horizontal: 6),
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                            priority!,
                                            style: const TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              /* ------------------ Work Tile ------------------ */

                              Text(
                                workOrder.workOrderName ?? "",
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              /* ------------------ Other Details - First Line ------------------ */

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    size: 18,
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    // DateFormat.yMMMEd().format(workOrder.plannedEndDate)
                                    DateFormat.yMMMd().format(workOrder.plannedStartDate! as DateTime),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              /* ------------------ Other Details - Second Line ------------------ */

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    size: 18,
                                    Icons.approval_outlined,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    workOrder.locationName ?? "",
                                    style: TextStyle(color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              /* ------------------ Other Details - Third Line ------------------ */

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    size: 18,
                                    Icons.token_rounded,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    workOrder.assetName ?? "",
                                    style: TextStyle(color: Colors.grey.shade400),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              /* ------------------ Other Details - Last Line ------------------ */

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              //       children: [
                              //         // Icon(
                              //         //   size: 18,
                              //         //   Icons.person_outline_rounded,
                              //         //   color: Colors.grey.shade400,
                              //         // ),
                              //         // const SizedBox(
                              //         //   width: 10,
                              //         // ),
                              //         // Container(
                              //         //   decoration: BoxDecoration(
                              //         //       color: Colors.grey.shade300,
                              //         //       borderRadius:
                              //         //           BorderRadius.circular(3)),
                              //         //   child: Padding(
                              //         //     padding: const EdgeInsets.symmetric(
                              //         //         vertical: 1.5, horizontal: 6),
                              //         //     child: Text("Me",
                              //         //         style: TextStyle(
                              //         //             color: Colors.grey.shade400)),
                              //         //   ),
                              //         // ),
                              //       ],
                              //     ),
                              //
                              //     /* ------------------ Bookmark And More  ------------------ */
                              //     // Row(
                              //     //   mainAxisAlignment: MainAxisAlignment.start,
                              //     //   children: [
                              //     //     InkWell(
                              //     //       child: Icon(
                              //     //         size: 18,
                              //     //         Icons.bookmark_border_outlined,
                              //     //         color: Colors.grey.shade400,
                              //     //       ),
                              //     //     ),
                              //     //     const SizedBox(
                              //     //       width: 10,
                              //     //     ),
                              //     //     InkWell(
                              //     //       onTap: () {
                              //     //         Navigator.push(
                              //     //           context,
                              //     //           MaterialPageRoute(
                              //     //             builder: (context) => WorkorderDetailsPage(
                              //     //                 workOrder: state.workOrders![index]),
                              //     //           ),
                              //     //         );
                              //     //       },
                              //     //       child: Icon(
                              //     //         size: 18,
                              //     //         Icons.more_horiz_rounded,
                              //     //         color: Colors.grey.shade400,
                              //     //       ),
                              //     //     ),
                              //     //   ],
                              //     // ),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      );
                    },
                    // The separators
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 3,
                        color: Colors.grey.shade300,
                      );
                    }),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
