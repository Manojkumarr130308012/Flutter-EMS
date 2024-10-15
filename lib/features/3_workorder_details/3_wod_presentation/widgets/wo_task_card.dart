import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';

import '../../../12_workorder_task/presentation/bloc/work_order_task_cubit.dart';
import '../../1_wod_domain/workorder_update_api.dart';

class TasksCard extends StatefulWidget {
  final WorkOrderTaskCubit cubit;
  final String workOrderId;

  const TasksCard({
    super.key,
    required this.cubit,
    required this.workOrderId,
  });

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  void initState() {
    widget.cubit.fetchWorkOrderTasks(widget.workOrderId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> segmentedControlGroupValues = [];

    return GestureDetector(
      child: BlocProvider(
        create: (context) => WorkOrderTaskCubit(),
        child: BlocBuilder<WorkOrderTaskCubit, WorkOrderTaskState>(
          bloc: widget.cubit,
          builder: (context, state) {
            /////////////////////////// LOADING INDICATOR \\\\\\\\\\\\\\\\\\\\\\\\\\
            if (state is WorkOrderTaskLoadingState) {
              Widget loadingIndicator = tasksUIHelper(
                child: const CupertinoActivityIndicator(),
              );
              return loadingIndicator;
            }

            /////////////////////////// CARD \\\\\\\\\\\\\\\\\\\\\\\\\\
            if (state is WorkOrderTaskLoadedState) {
              // Initialize the segmented control group values

              segmentedControlGroupValues =
              List.generate(state.workOrderTasks.length,
                      (index) => getSegmentValueFromTaskStatus(state.workOrderTasks[index].taskStatus));

              print(segmentedControlGroupValues);
              // Filters the completed tasks based on workOrderTasks taskStatus
              List completed = state.workOrderTasks
                  .where((element) => element.taskStatus == "Completed")
                  .toList();

              return tasksCard(completed, state, segmentedControlGroupValues);
            } else {
              /////////////////////////// IF NO TASK \\\\\\\\\\\\\\\\\\\\\\\\\\
              Widget noTaskWidget = tasksUIHelper(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 8, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tasks",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "No Tasks Available",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              return noTaskWidget;
            }
          },
        ),
      ),
      onTap: () {
        buildShowCupertinoModalPopup(context, segmentedControlGroupValues);
      },
    );
  }

  /////////////////////////////////////////////////////////////
  /// WIDGET METHODS
  /////////////////////////////////////////////////////////////

  /////////////////////////// CARD \\\\\\\\\\\\\\\\\\\\\\\\\\
  Widget tasksCard(List<dynamic> completed, WorkOrderTaskLoadedState state,
      List<int> segmentedControlGroupValues) {
    return Card(
      elevation: 0, // Set elevation to 0 for a flat card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Customize the border radius
        side: const BorderSide(
          color: Colors.grey, // Customize the border color
          width: 1.0, // Customize the border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 8, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tasks",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  state.workOrderTasks.length > 1
                      ? "${state.workOrderTasks.length} Tasks Available"
                      : "${state.workOrderTasks.length} Task Available",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /////////////////////////// UI HELPER \\\\\\\\\\\\\\\\\\\\\\\\\\
  Widget tasksUIHelper({required Widget child}) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 0, // Set elevation to 0 for a flat card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Customize the border radius
          side: const BorderSide(
            color: Colors.grey, // Customize the border color
            width: 1.0, // Customize the border width
          ),
        ),
        child: child,
      ),
    );
  }

  /////////////////////////// TASKS - MODAL POP UP \\\\\\\\\\\\\\\\\\\\\\\\\\
  Future<dynamic> buildShowCupertinoModalPopup(
      BuildContext context, List<int> segmentedControlGroupValues) {

    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                  height: 730,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                            Text(
                              context.local.tasks,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 50,
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        Expanded(
                          child: BlocConsumer<WorkOrderTaskCubit,
                              WorkOrderTaskState>(
                            bloc: widget.cubit,
                            listener: (context, state) {
                              if (state is WorkOrderTaskErrorState) {
                                SnackBar snackBar = SnackBar(
                                  content: Text(state.error),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            builder: (context, state) {
                              if (state is WorkOrderTaskLoadingState) {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                              if (state is WorkOrderTaskLoadedState) {
                                return ListView.separated(
                                  itemCount: state.workOrderTasks.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Map<int, Widget> myTabs = <int, Widget>{
                                      0: const Text("Open"),
                                      1: const Text("On Hold"),
                                      2: const Text("In Progress"),
                                      3: const Text("Complete")
                                    };

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      "${index + 1}. ${state.workOrderTasks[index].taskName}",
                                                      maxLines: 3,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons
                                                                .image_outlined,
                                                            color: Colors
                                                                .grey.shade400,
                                                          )),
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.note_outlined,
                                                            color: Colors
                                                                .grey.shade400,
                                                          )),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          CupertinoSlidingSegmentedControl<int>(
                                            groupValue:
                                            segmentedControlGroupValues[
                                            index],
                                            children: myTabs,
                                            onValueChanged: (int? newValue) {
                                              setState(() {
                                                segmentedControlGroupValues[
                                                index] = newValue!;
                                              });

                                              WorkOrderStatusUpdateApi.updateWorkOrderTaskStatus(
                                                  state.workOrderTasks[index].id!,getStatusFromSegment(newValue!),state.workOrderTasks[index].workOrderId!,state.workOrderTasks[index].currentReading!,state.workOrderTasks[index].meterId ?? '9b6dfe7d-eac9-4efe-ab75-cb7147cf29bd');

                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider();
                                  },
                                );
                              }
                              return const Center(
                                child: Text('No tasks available'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  /////////////////////////////////////////////////////////////
  /// API & HELPER FUNCTIONS
  /////////////////////////////////////////////////////////////

  // Helper function to map the segmented control value to the task status
  String getStatusFromSegment(int segmentValue) {
    switch (segmentValue) {
      case 0:
        return "Open";
      case 1:
        return "OnHold";
      case 2:
        return "InProgress";
      case 3:
        return "Complete";
      default:
        return "Open";
    }
  }

  getSegmentValueFromTaskStatus(String? taskStatus) {
    switch (taskStatus) {
      case "Open":
        return 0;
      case "OnHold":
        return 1;
      case "InProgress":
        return 2;
      case "Complete":
        return 3;
      default:
        return 0;
    }
  }

  // API call to update the task status
  // void updateTaskStatus({required String taskId, required String newStatus}) {
  //   // Call the cubit or repository to update the task status
  //   widget.cubit.updateTaskStatus(taskId, newStatus).then((success) {
  //     if (success) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Task status updated successfully'),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text('Failed to update task status'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //   });
  // }
}
