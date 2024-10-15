import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:oriens_eam/features/2_workorder/domain/entities/workorder.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/dependency_injection/di_container.dart';
import '../../../../core/utils/colors_util.dart';
import '../../../../core/utils/date_util.dart' as date_util;
import '../../presentation/bloc/workorder_bloc.dart';

/////////////////////////////////////////////////////////////
/// WORK ORDER CALENDER PAGE
/////////////////////////////////////////////////////////////

class WorkOrderCalenderPage extends StatefulWidget {
  const WorkOrderCalenderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkOrderCalenderPageState();
}

class _WorkOrderCalenderPageState extends State<WorkOrderCalenderPage> {
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();

  final kToday = DateTime.utc(2023, 10, 02);
  final kFirstDay = DateTime(
      DateTime.now().year - 10, DateTime.now().month, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year + 25, DateTime.now().month, DateTime.now().day);

  Widget _buildEventMarker(
      BuildContext context, DateTime date, List<WorkorderEntity> events) {
    if (events.isEmpty) {
      return const SizedBox.shrink(); // No events, so hide the marker
    }
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  Map<DateTime, List<WorkorderEntity>> workOrderListBydate = {};

  Map<DateTime, List<WorkorderEntity>> processData(
      List<WorkorderEntity> workOrders) {
    var format = DateFormat('yyyy-MM-dd');
    final grouped = <DateTime, List<WorkorderEntity>>{};

    for (WorkorderEntity event in workOrders) {
      var date = format.format(event.plannedStartDate != null
          ? event.targetStartDate!
          : DateTime.now());
      if (grouped.containsKey(DateTime.parse(date))) {
        grouped[DateTime.parse(date)]?.add(event);
      } else {
        grouped[DateTime.parse(date)] = [event];
      }
    }
    workOrderListBydate = grouped;
    return workOrderListBydate;
  }

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light));
    return BlocProvider<WorkorderBloc>(
      create: (context) => sl()..add(const GetWorkOrderEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // bottomOpacity: 0.0,
          automaticallyImplyLeading: false,
          elevation: .5,
          leadingWidth: 90,
          centerTitle: true,
          title: const Text(
            "Calendar",
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
                onPressed: () {
                  context.pop();
                },
              ),
              const Text(
                'Back',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<WorkorderBloc, WorkorderState>(
          builder: (context, state) {
            if (state is WorkorderLoading) {
              return const Align(
                  alignment: Alignment.topCenter,
                  child: CupertinoActivityIndicator());
            }

            if (state is WorkorderError) {
              return const Align(
                  alignment: Alignment.topCenter,
                  child: Text("An Error Occurred"));
            }

            if (state is WorkorderLoaded) {
              // Assigns Workorders List from state to local variable "workOrderList".
              List<WorkorderEntity>? workOrderList = state.workOrders;

              processData(workOrderList!);

              // Filters all the workorders that matched the selected date in the calender and
              // assigns to the local variable so its easy to load data in list tile.
              var workOrders = workOrderList.where((element) {
                return element.targetStartDate?.month == _selectedDay?.month;
              }).toList();

              final kEvents = LinkedHashMap<DateTime, List<WorkorderEntity>>(
                equals: isSameDay,
                hashCode: getHashCode,
              )..addAll(workOrderListBydate);

              List<WorkorderEntity> getEventsForDay(DateTime day) {
                return kEvents[day] ?? [];
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Center(
                  //   child: _selectedDay == null
                  //       ? Text(
                  //           DateFormat('MMMM yyyy').format(currentDateTime).toString(),
                  //           style: const TextStyle(
                  //               color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
                  //         )
                  //       : Text(
                  //           DateFormat('MMMM yyyy').format(_selectedDay!).toString(),
                  //           style: const TextStyle(
                  //               color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
                  //         ),
                  // Text(
                  //   date_util.DateUtils.months[currentDateTime.month - 1] +
                  //       ' ' +
                  //       currentDateTime.year.toString(),
                  //   style: const TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
                  // ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),Allenzo137

                  TableCalendar(
                    headerVisible: true,
                    calendarStyle: CalendarStyle(
                      holidayTextStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      weekendTextStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      defaultTextStyle: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      todayTextStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.circle,
                      ),
                    ),
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: _focusedDay,
                    eventLoader: getEventsForDay,
                    calendarFormat: _calendarFormat,
                    calendarBuilders:
                        CalendarBuilders(markerBuilder: _buildEventMarker),
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                  ///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\
                  const Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _selectedDay == null
                        ? Text(
                            DateFormat('dd MMMM yyyy')
                                .format(currentDateTime)
                                .toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            DateFormat('dd MMMM yyyy')
                                .format(_selectedDay!)
                                .toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ///////////////////////////  \\\\\\\\\\\\\\\\\\\\\\\\\\
                  Expanded(
                    child: ListView.separated(
                        itemCount: workOrders.length,
                        itemBuilder: (context, index) {
                          var workOrder = workOrders[index];
                          String? priority;
                          if (workOrder.priorityName!.isNotEmpty) {
                            priority = workOrder.priorityName?.substring(0, 6);
                          } else {
                            priority = "";
                          }

                          // String? priority;
                          // priority = workOrder?.priorityName != null ?? "";

                          return workOrders.isNotEmpty
                              ? SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        /* ------------------ Status, WO No. Priority ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            /* ------------------ Status ------------------ */
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 1.5,
                                                        horizontal: 6),
                                                child: Text(
                                                    workOrder.status ?? "",
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            /* ------------------ WO No. & Priority ------------------ */
                                            Row(
                                              children: [
                                                /* ------------------ WO No. ------------------ */
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 1.5,
                                                        horizontal: 6),
                                                    child: Text(
                                                      "#${workOrder.code?.trim()}",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 1.5,
                                                        horizontal: 6),
                                                    child: Text(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: false,
                                                      priority!,
                                                      style: const TextStyle(
                                                          color: Colors.blue),
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
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        /* ------------------ Other Details - First Line ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              size: 18,
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.grey.shade400,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              // DateFormat.yMMMEd().format(workOrder.plannedEndDate)
                                              DateFormat.yMMMd().format(
                                                  workOrder.targetStartDate!),
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        /* ------------------ Other Details - Second Line ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                              style: TextStyle(
                                                  color: Colors.grey.shade400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        /* ------------------ Other Details - Third Line ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                              style: TextStyle(
                                                  color: Colors.grey.shade400),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        /* ------------------ Other Details - Last Line ------------------ */
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  size: 18,
                                                  Icons.person_outline_rounded,
                                                  color: Colors.grey.shade400,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade300,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 1.5,
                                                        horizontal: 6),
                                                    child: Text("Me",
                                                        style: TextStyle(
                                                            color: Colors.grey
                                                                .shade400)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            /* ------------------ Bookmark And More  ------------------ */
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  child: Icon(
                                                    size: 18,
                                                    Icons
                                                        .bookmark_border_outlined,
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                // InkWell(
                                                //   onTap: () {
                                                //     Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             WorkorderDetailsPage(
                                                //                 workOrder: workOrders[index]),
                                                //       ),
                                                //     );
                                                //   },
                                                //   child: Icon(
                                                //     size: 18,
                                                //     Icons.more_horiz_rounded,
                                                //     color: Colors.grey.shade400,
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "No Data Available for selected Date",
                                    style: TextStyle(color: Colors.grey),
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
                  )
                ],
              );
            } else {
              return (const Text("Error"));
            }
          },
        ),
      ),
    );
  }

/* ----------------------------------------------------------------- */
/*           )))))))))))))>> WIDGETS <<((((((((((((( */
/* ----------------------------------------------------------------- */
  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: capsuleView(index),
          );
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  date_util
                      .DateUtils.weekdays[currentMonthList[index].weekday - 1]
                      .toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color:
                          (currentMonthList[index].day != currentDateTime.day)
                              ? Colors.grey.shade400
                              : Colors.green),
                ),
                const Spacer(),
                (currentMonthList[index].day != currentDateTime.day)
                    ? Text(
                        currentMonthList[index].day.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: (currentMonthList[index].day !=
                                    currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.green),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.red.shade100,
                        child: Text(
                          currentMonthList[index].day.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: (currentMonthList[index].day !=
                                      currentDateTime.day)
                                  ? HexColor("465876")
                                  : Colors.green),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      color: Colors.transparent,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        titleView(),
        hrizontalCapsuleListView(),
      ]),
    );
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}
