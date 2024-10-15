import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/core/utils/extensions/widget_extension.dart';
import 'package:oriens_eam/features/1_dashboard/3_dashboard_presentation/widgets/app_bar.dart';
import 'package:oriens_eam/features/2_workorder/presentation/bloc/local/local_workorder_bloc.dart';
import 'package:oriens_eam/features/3_workorder_details/3_wod_presentation/view/wo_details_page.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../../core/dependency_injection/di_container.dart';
import '../../domain/entities/workorder.dart';
import '../bloc/workorder_bloc.dart';

/////////////////////////////////////////////////////////////
/// WORK ORDER PAGE
/////////////////////////////////////////////////////////////

/// This page is from BNB "work order".
/// MAIN WORK ORDERS LIST PAGE
class WorkOrdersPage extends StatefulWidget {
  WorkOrdersPage({super.key, this.result});

  String? result;

  @override
  State<WorkOrdersPage> createState() => _WorkOrdersPageState();
}

class _WorkOrdersPageState extends State<WorkOrdersPage> {
  /// Helper variables for Bookmark functionality
  bool isSelectItem = false;
  Map<int, bool> selectedItem = {};

  List<String> sortOptions = ["New", "Inprg", "Close", "Comp"];
  String? selectedWorkRequest;

  /// Local variable for getting and showing filtered workorders from search field.
  List<WorkorderEntity> _foundWorkOrder = [];
  List<WorkorderEntity> _filteredWorkOrder = [];
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();

  /// Function used for search functionality
  void _searchWorkOrder(
      String enteredKeyword, List<WorkorderEntity>? workOrders) {
    List<WorkorderEntity>? results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        _filteredWorkOrder = workOrders!;
      });
    } else {
      results = workOrders
          ?.where(
            (element) => element.workOrderName!
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()),
          )
          .toList();
      setState(() {
        _filteredWorkOrder = results!;
      });
    }
  }

  /// Function used for search functionality
  void _searchBarCode(
      String enteredKeyword, List<WorkorderEntity>? workOrders) {
    List<WorkorderEntity>? results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        _filteredWorkOrder = workOrders!;
      });
    } else {
      results = workOrders
          ?.where(
            (element) =>
            enteredKeyword.toLowerCase()
                    .contains(element.assetName!.toLowerCase()) ||
                enteredKeyword.toLowerCase()
                    .contains(element.assetCode!.toLowerCase()),
          )
          .toList();

      setState(() {
        _filteredWorkOrder = results!;
        print("resultsssssssss${results?.length}");

      });
    }

  }

  /// Function used for Filter functionality
  void filterWorkOrder(String status) {
    setState(() {
      if (status == "All") {
        _filteredWorkOrder = _foundWorkOrder;
      } else {
        if (selectedWorkRequest == "All") {
          _filteredWorkOrder = _filteredWorkOrder
              .where((request) => request.status == status)
              .toList();
        } else {
          _filteredWorkOrder = _foundWorkOrder
              .where((request) => request.status == status)
              .toList();
        }
      }
      selectedWorkRequest = status.capitalize();
    });
  }

  void _onFilterApplied(List<WorkorderEntity> filteredOrders) {
    setState(() {
      _filteredWorkOrder = filteredOrders;
    });
  }

  @override
  void initState() {
    sl<WorkorderBloc>().add(const GetWorkOrderEvent());
    // BlocProvider.of<AuthBloc>(context).add(LoginEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.result != "") {
        _searchBarCode(widget.result!, _foundWorkOrder);
      }
    });
    super.initState();
  }

  /////////////////////////// BUILD METHOD \\\\\\\\\\\\\\\\\\\\\\\\\\
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(240),
        child: Material(
          elevation: 4,
          child: Container(
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                OAppBar(
                  title: context.local.work_orders,
                  titleCenter: false,
                  leadingIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                        ),
                        onPressed: () {
                          context.go("/home");
                        },
                      ),
                    ],
                  ),
                  icon: Icons.calendar_today_outlined,
                  qrIcon: Icons.qr_code_scanner_outlined,
                  notificationIcon: Icons.filter_list,
                  onPress: () {
                    context.go('/workorder/calender');
                  },
                  qrOnPress: () async {
                    var res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SimpleBarcodeScannerPage(),
                        ));
                    if (res is String) {
                      print("resuuuult${res}");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WorkOrdersPage(result: res);
                      }));
                    }

                  },
                  notificationOnPress: () {},
                ),
                /////////////////////////// SEARCH FIELD \\\\\\\\\\\\\\\\\\\\\\\\\\
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: TextField(
                    onChanged: (value) =>
                        _searchWorkOrder(value, _filteredWorkOrder),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.all(8),
                        hintText: context.local.search_by,
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        prefixIconColor: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /* ------------------ 2_Filters Section ------------------ */
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: sortOptions
                        .map(
                          (category) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FilterChip(
                              label: Text(category),
                              selected: selectedWorkRequest == category,
                              onSelected: (selected) {
                                setState(() {
                                  filterWorkOrder(selected
                                      ? category.toUpperCase()
                                      : "All");
                                });
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                /* ------------------ Sort By Section ------------------ */
                SortBySection(
                  workOrders: _filteredWorkOrder,
                  checkBoxListTileModel: checkBoxListTileModel,
                  onFiltered: _onFilterApplied,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),

      /////////////////////////// BODY  \\\\\\\\\\\\\\\\\\\\\\\\\\
      body: BlocBuilder<WorkorderBloc, WorkorderState>(
        builder: (context, state) {
          if (state is WorkorderLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is WorkorderError) {
            return const Center(child: Icon(Icons.refresh));
          }

          if (state is WorkorderLoaded) {
            _foundWorkOrder = state.workOrders!;
            if (_filteredWorkOrder.isEmpty) {
              _filteredWorkOrder = state.workOrders!;
            }
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Expanded(
                child: ListView.builder(
                  itemCount: _filteredWorkOrder.length,
                  // The list items
                  itemBuilder: (context, index) {
                    String? priority;
                    if (_filteredWorkOrder[index].priorityName!.isNotEmpty) {
                      priority = _filteredWorkOrder[index]
                              .priorityName!
                              .startsWith("N")
                          ? _filteredWorkOrder[index]
                              .priorityName
                              ?.substring(0, 7)
                          : _filteredWorkOrder[index]
                              .priorityName
                              ?.substring(0, 10);
                    } else {
                      priority = "";
                    }

                    selectedItem[index] = selectedItem[index] ?? false;
                    bool? isSelectedData = selectedItem[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WorkorderDetailsPage(
                                workOrder: state.workOrders![index]),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /* ------------------ Status ------------------ */
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green[400]!,
                                      Colors.green[600]!
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: Text(
                                  _filteredWorkOrder[index].status ?? "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  /* ------------------ Work Tile ------------------ */
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    child: Text(
                                      _filteredWorkOrder[index].workOrderName ??
                                          "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Aeon',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  /* ------------------ WO No. Priority ------------------ */
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "#${_filteredWorkOrder[index].code?.trim()}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Aeon',
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      Text(
                                        priority == "" ? "" : priority!,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Aeon',
                                            color: priority == "Emergency "
                                                ? Colors.red[600]
                                                : Colors.blue[600]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey[300]),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.build, color: Colors.grey[600]),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    child: Text(
                                      _filteredWorkOrder[index].workTypeName ==
                                              null
                                          ? ""
                                          : _filteredWorkOrder[index]
                                                  .workTypeName ??
                                              "",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Aeon',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              /* ------------------ Other Details - First Line ------------------ */
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.grey[600]),
                                  const SizedBox(width: 8),
                                  Text(
                                    "${_filteredWorkOrder[index].locationCode ?? ""} - ${_filteredWorkOrder[index].locationName ?? ""}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Aeon',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              /* ------------------ Other Details - Second Line ------------------ */

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.business_center,
                                      color: Colors.grey[600]),
                                  const SizedBox(width: 8),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.75,
                                    child: Text(
                                      "${_filteredWorkOrder[index].assetCode ?? ""} - ${_filteredWorkOrder[index].assetName ?? ""}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Aeon',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              /* ------------------ Other Details - Third Line ------------------ */
                              Row(
                                children: [
                                  Icon(Icons.person, color: Colors.grey[600]),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Me',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Aeon',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        !isSelectedData
                                            ? BlocProvider.of<
                                                    LocalWorkorderBloc>(context)
                                                .add(SaveWorkOrder(
                                                    state.workOrders![index]))
                                            : showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                      "Remove Bookmark"),
                                                  content: const Text(
                                                      "Are you sure want to remove saved work order?"),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedItem[index] =
                                                              !isSelectedData;
                                                          isSelectItem =
                                                              selectedItem
                                                                  .containsValue(
                                                                      true);
                                                        });
                                                        BlocProvider.of<
                                                                    LocalWorkorderBloc>(
                                                                context)
                                                            .add(RemoveWorkOrder(
                                                                state.workOrders![
                                                                    index]));
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text("No"),
                                                    ),
                                                  ],
                                                ),
                                              );

                                        !isSelectedData
                                            ? setState(() {
                                                selectedItem[index] =
                                                    !isSelectedData;
                                                isSelectItem = selectedItem
                                                    .containsValue(true);
                                              })
                                            : null;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.all(
                                            12), // Background color
                                      ),
                                      child: Icon(
                                        size: isSelectedData! ? 21 : 18,
                                        isSelectedData
                                            ? Icons.bookmark_added
                                            : Icons.bookmark_add,
                                        color: isSelectedData
                                            ? Colors.green
                                            : Colors.grey.shade400,
                                        fill: 1.0,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WorkorderDetailsPage(
                                                    workOrder: state
                                                        .workOrders![index]),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.white,
                                        padding: const EdgeInsets.all(
                                            12), // Background color
                                      ),
                                      child: const Icon(Icons.more_vert,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }
}

/* ------------------ SORT BY SECTION ------------------ */
class SortBySection extends StatefulWidget {
  final List<WorkorderEntity> workOrders;
  final List<CheckBoxListTileModel> checkBoxListTileModel;
  final Function(List<WorkorderEntity>) onFiltered;

  const SortBySection(
      {super.key,
      required this.workOrders,
      required this.checkBoxListTileModel,
      required this.onFiltered});

  @override
  State<SortBySection> createState() => _SortBySectionState();
}

class _SortBySectionState extends State<SortBySection> {
  String selectedTitle = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // BOTTOM SHEET
                  buildShowModalBottomSheet(context);
                },
                child: const Icon(Icons.sort_outlined),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(selectedTitle.isNotEmpty
                  ? selectedTitle
                  : "Sort By"), // Show selected title or default text
            ],
          ),
          Text(" ${widget.workOrders.length} Results"),
        ],
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        builder: (BuildContext context) {
          return SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 3,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Text(
                    context.local.sort_by,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  /* ------------------ List View ------------------ */

                  Expanded(
                    child: ListView.separated(
                        itemCount: widget.checkBoxListTileModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            child: Center(
                              child: ListTile(
                                titleAlignment: ListTileTitleAlignment.center,
                                title: Text(
                                  widget.checkBoxListTileModel[index].title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                trailing:
                                    widget.checkBoxListTileModel[index].isCheck
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.blue,
                                          )
                                        : null,
                                selectedColor: Colors.blue,
                                onTap: () {
                                  _updateSelectedTitle(
                                      index); // Update selected tile
                                  _filterWorkOrder(
                                      widget.checkBoxListTileModel[index].title,
                                      widget.workOrders);
                                  Navigator.pop(
                                      context); // Close the modal on selection
                                },
                                onLongPress: () {},
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _updateSelectedTitle(int index) {
    setState(() {
      // Unselect all tiles first
      for (var tile in widget.checkBoxListTileModel) {
        tile.isCheck = false;
      }
      // Select the tapped tile
      widget.checkBoxListTileModel[index].isCheck = true;
      selectedTitle = widget.checkBoxListTileModel[index].title;
    });
  }

  void _filterWorkOrder(
      String filteredKeyword, List<WorkorderEntity>? workOrders) {
    if (filteredKeyword == "Planned End Date") {
      workOrders?.sort((a, b) {
        if (a.plannedEndDate == null && b.plannedEndDate == null) return 0;
        if (a.plannedEndDate == null) return 1; // Null names go last
        if (b.plannedEndDate == null) return -1; // Null names go last
        return a.plannedEndDate!.compareTo(b.plannedEndDate!);
      });
    } else if (filteredKeyword == "Location") {
      workOrders?.sort((a, b) {
        if (a.locationName == null && b.locationName == null) return 0;
        if (a.locationName == null) return 1; // Null names go last
        if (b.locationName == null) return -1; // Null names go last
        return a.locationName!.compareTo(b.locationName!);
      });
    } else if (filteredKeyword == "Asset") {
      workOrders?.sort((a, b) {
        if (a.assetName == null && b.assetName == null) return 0;
        if (a.assetName == null) return 1; // Null names go last
        if (b.assetName == null) return -1; // Null names go last
        return a.assetName!.compareTo(b.assetName!);
      });
    } else if (filteredKeyword == "Status") {
      workOrders?.sort((a, b) {
        if (a.status == null && b.status == null) return 0;
        if (a.status == null) return 1; // Null names go last
        if (b.status == null) return -1; // Null names go last
        return a.status!.compareTo(b.status!);
      });
    } else {
      // Handle any other cases if needed
    }
    widget.onFiltered(workOrders!);
  }
}

class CheckBoxListTileModel {
  String title;
  bool isCheck;

  CheckBoxListTileModel({required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "Planned End Date", isCheck: false),
      CheckBoxListTileModel(title: "Asset", isCheck: false),
      CheckBoxListTileModel(title: "Location", isCheck: false),
      CheckBoxListTileModel(title: "Status", isCheck: false),

      // CheckBoxListTileModel(title: "Last Updated", isCheck: false),
      // CheckBoxListTileModel(title: "Newest", isCheck: false),
      // CheckBoxListTileModel(title: "Oldest", isCheck: false),
      // CheckBoxListTileModel(title: "Primary Worker", isCheck: false),
      // CheckBoxListTileModel(title: "Priority", isCheck: false),
      // CheckBoxListTileModel(title: "Team", isCheck: false),
    ];
  }
}
