import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/workorder_bloc.dart';
import 'package:oriens_eam/features/connectivity_check/internet_connectivity_bloc.dart';

import '../../../../core/dependency_injection/di_container.dart';
import '../../../../core/utils/constants.dart';
import '../../../2_workorder/3_wo_presentation/view/dashboard_wo_page.dart';
import '../../../2_workorder/domain/entities/workorder.dart';

/////////////////////////////////////////////////////////////
/// DASHBOARD BOTTOM WIDGET
/////////////////////////////////////////////////////////////

/// Displays List view of work orders counts by status
class DashBoardBottomWidget extends StatefulWidget {
  const DashBoardBottomWidget({
    super.key,
  });

  @override
  State<DashBoardBottomWidget> createState() => _DashBoardBottomWidgetState();
}

class _DashBoardBottomWidgetState extends State<DashBoardBottomWidget> {
/////////////////////////// BUILD METHOD \\\\\\\\\\\\\\\\\\\\\\\\\\
  @override
  Widget build(BuildContext context) {
    // Used to Display status counts.
    /// STATUS MAP: All WorkOrder Statuses with 0 initial count value.
    Map<String, int?> statusMap = {
      "All Pending": 0,
      "Open": 0,
      "In Progress": 0,
      "Stop": 0,
      "Past Due": 0,
      "Due Today": 0,
      "Completed": 0
    };
    //  Used for filtering work orders by status
    Map<int, List<WorkorderEntity>?> newStatusMap = {
      0: [],
      1: [],
      2: [],
      3: [],
      4: [],
      5: [],
      6: [],
    };

    /// TITLES :
    var titles = statusMap.entries.toList();
    bool refresh = false;

    return Expanded(
      child: RefreshIndicator(
        // onRefresh: () async {
        //   await _bloc.fetchServiceRequest();
        // },
        onRefresh: () async {},
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: BlocListener<InternetConnectivityBloc,
                  InternetConnectivityState>(
                listener: (context, state) {
                  if (state is InternetConnectedState) {
                    BlocProvider<WorkorderBloc>(
                      create: (context) => sl()..add(const GetWorkOrderEvent()),
                    );
                  }
                },
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  borderOnForeground: false,
                  child: ListTile(
                    minLeadingWidth: 5,
                    leading: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      height: 30,
                      width: 5,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          0.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                      ],
                    ),
                    title: const Text("Saved"),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //   return DashboardWorkOrdersPage(
                      //       workOrders: newStatusMap[index] ?? [],
                      //       title: titles[index].key,
                      //       color: colors[index]);
                      // }));
                    },
                  ),
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 16, // spacing between rows
                    crossAxisSpacing: 16, // spacing between columns
                  ),
                  padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: titles.length, // total number of items
                  itemBuilder: (BuildContext context, int index) {
                    return BlocConsumer<WorkorderBloc, WorkorderState>(
                      listener: (context, state) {
                        if (state is WorkorderError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${state.error}"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return BlocBuilder<WorkorderBloc, WorkorderState>(
                          builder:
                              (BuildContext context, WorkorderState state) {
                            if (state is WorkorderLoading) {
                              return const Center(
                                  child: CupertinoActivityIndicator());
                            }

                            if (state is WorkorderError) {
                              return const Center(child: Icon(Icons.refresh));
                            }

                            if (state is WorkorderLoaded) {
                              // print("@HomeBottom 90: WorkOrders Length ${state.workOrders?.length}");

                              /////////////////////////// ALL PENDING \\\\\\\\\\\\\\\\\\\\\\\\\\

                              newStatusMap[0] = state.workOrders
                                      ?.where(
                                          (element) => element.status != "COMP")
                                      .toList() ??
                                  [];

                              statusMap["All Pending"] = state.workOrders
                                  ?.where((element) => element.status != "COMP")
                                  .length;

                              /////////////////////////// NEW \\\\\\\\\\\\\\\\\\\\\\\\\\

                              newStatusMap[1] = state.workOrders
                                  ?.where((element) => element.status == "NEW")
                                  .toList();

                              statusMap["Open"] = state.workOrders
                                  ?.where((element) => element.status == "NEW")
                                  .length;

                              /////////////////////////// IN PROGRESS \\\\\\\\\\\\\\\\\\\\\\\\\\

                              newStatusMap[2] = state.workOrders
                                      ?.where((element) =>
                                          element.status == "INPRG")
                                      .toList() ??
                                  [];

                              statusMap["In Progress"] = state.workOrders
                                  ?.where(
                                      (element) => element.status == "INPRG")
                                  .length;

                              /////////////////////////// STOP \\\\\\\\\\\\\\\\\\\\\\\\\\

                              newStatusMap[3] = state.workOrders
                                  ?.where((element) => element.status == "STP")
                                  .toList();

                              statusMap["Stop"] = state.workOrders
                                  ?.where((element) => element.status == "STP")
                                  .length;

                              /////////////////////////// PAST DUE \\\\\\\\\\\\\\\\\\\\\\\\\\

                              // newStatusMap[4] = state.workOrders
                              //     ?.where((element) =>
                              //         element.targetEndDate.toString().substring(0, 10) ==
                              //         DateTime.now().toString().substring(0, 10))
                              //     .toList();
                              //
                              // statusMap["Past Due"] = state.workOrders
                              //     ?.where((element) =>
                              //         element.targetEndDate.toString().substring(0, 10) ==
                              //         DateTime.now().toString().substring(0, 10))
                              //     .length;

                              /////////////////////////// DUE TODAY \\\\\\\\\\\\\\\\\\\\\\\\\\

                              // newStatusMap[5] = state.workOrders
                              //     ?.where((element) =>
                              //         element.targetStartDate.toString().substring(0, 10) ==
                              //         DateTime.now().toString().substring(0, 10))
                              //     .toList();
                              //
                              // statusMap["Due Today"] = state.workOrders
                              //     ?.where((element) =>
                              //         element.targetStartDate.toString().substring(0, 10) ==
                              //         DateTime.now().toString().substring(0, 10))
                              //     .length;

                              /////////////////////////// COMPLETED \\\\\\\\\\\\\\\\\\\\\\\\\\

                              newStatusMap[6] = state.workOrders
                                  ?.where((element) => element.status == "COMP")
                                  .toList();

                              statusMap["Completed"] = state.workOrders
                                  ?.where((element) => element.status == "COMP")
                                  .length;

                              List<int?> counts = statusMap.values.toList();

                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DashboardWorkOrdersPage(
                                        workOrders: newStatusMap[index] ?? [],
                                        title: titles[index].key,
                                        color: colors[index]);
                                  }));
                                },
                                child: ProjectCard(
                                  title: titles[index].key,
                                  count: counts[index].toString(),
                                  color: colors[index],
                                  icon: icons[index],
                                ),
                              );
                            }
                            return const Text("Error Occurred");
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String count;
  final Color color;
  final IconData? icon;

  const ProjectCard(
      {super.key,
      required this.title,
      required this.count,
      required this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Icon(
                icon,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Aeon',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Aeon',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
