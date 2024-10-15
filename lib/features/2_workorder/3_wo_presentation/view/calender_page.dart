import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:oriens_eam/features/1_dashboard/3_dashboard_presentation/widgets/app_bar.dart';
import 'package:oriens_eam/features/2_workorder/3_wo_presentation/view/workorder_calender_page.dart';
import 'package:oriens_eam/features/2_workorder/3_wo_presentation/widgets/dropdown_filter_chip.dart';

import '../../../../core/utils/colors_util.dart';
import '../../../../core/utils/date_util.dart' as date_util;

/* ----------------------------------------------------------------- */
/*           )))))))))))))>> CALENDER PAGE <<((((((((((((( */
/* ----------------------------------------------------------------- */

class CalenderPage extends StatefulWidget {
  static const routeName = '/calender_page';

  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();

    print("currentMonthList${currentMonthList}");
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 50,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
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
          child: Container(
            width: 80,
            height: 140,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: (currentMonthList[index].day != currentDateTime.day)
                        ? [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.6)
                          ]
                        : [
                            HexColor("ED6184"),
                            HexColor("EF315B"),
                            HexColor("E2042D")
                          ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 0.5, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 2,
                    color: Colors.black12,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      // color: Colors.blue,
      height: 100,
      // width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              HexColor("488BC8").withOpacity(0.7),
              HexColor("488BC8").withOpacity(0.5),
              HexColor("488BC8").withOpacity(0.3)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 0.5, 1.0],
            tileMode: TileMode.clamp),
        boxShadow: const [
          BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
              offset: Offset(4, 4),
              spreadRadius: 2)
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  /* ------------------ BUILD METHOD ------------------ */

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(240),
          child: Material(
            elevation: 4,
            child: Container(
              height: 230,
              width: double.infinity,
              child: Column(
                children: [
                  OAppBar(
                    title: 'Calender',
                    icon: Icons.wysiwyg_outlined,
                    onPress: () {},
                  ),
                  const WorkOrderCalenderPage(),
                ],
              ),
            ),
          ),
        ),

        /* ------------------ Body ------------------ */

        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              /* ------------------ Work Order List Section------------------ */

              buildExpanded(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpanded() {
    return Expanded(
      child: ListView.separated(
          itemCount: 1,
          // The list items
          itemBuilder: (context, index) {
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
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.5, horizontal: 6),
                            child: Text("Complete",
                                style: TextStyle(color: Colors.white)),
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
                                  "#00$index",
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
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.5, horizontal: 6),
                                child: Text(
                                  "Low",
                                  style: TextStyle(color: Colors.blue),
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

                    const Text(
                      "Suite B Temp High",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                        const Text(
                          "Completed 3 Sep 2023",
                          style: TextStyle(color: Colors.blue),
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
                          "Suite B",
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
                          "TRANE HVAC Suite B3",
                          style: TextStyle(color: Colors.grey.shade400),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    /* ------------------ Other Details - Last Line ------------------ */

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1.5, horizontal: 6),
                                child: Text("Me",
                                    style:
                                        TextStyle(color: Colors.grey.shade400)),
                              ),
                            ),
                          ],
                        ),

                        /* ------------------ Bookmark And More  ------------------ */
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Icon(
                                size: 18,
                                Icons.bookmark_border_outlined,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // debugPrint("$index");
                                // Navigator.restorablePushNamed(
                                //   context,
                                //   WorkOrdersPage.routeName,
                                // );
                              },
                              child: Icon(
                                size: 18,
                                Icons.more_horiz_rounded,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
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
    );
  }
}

/* ----------------------------------------------------------------- */
/*   )))))))))))))>> WIDGETS OF WORK ORDER PAGE  <<((((((((((((( */
/* ----------------------------------------------------------------- */

/* ------------------ SORT BY SECTION ------------------ */

class SortBySection extends StatelessWidget {
  const SortBySection({
    super.key,
    required this.checkBoxListTileModel,
  });

  final List<CheckBoxListTileModel> checkBoxListTileModel;

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
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .68,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 6,
                                ),
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
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Text(
                                    "Sort By",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),

                                /* ------------------ List View ------------------ */

                                Expanded(
                                  child: ListView.separated(
                                      itemCount: checkBoxListTileModel.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const Divider();
                                      },
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          height: 35,
                                          child: Center(
                                            child: ListTile(
                                              titleAlignment:
                                                  ListTileTitleAlignment.center,
                                              title: Text(
                                                checkBoxListTileModel[index]
                                                    .title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    // fontWeight:
                                                    //     FontWeight
                                                    //         .w600,
                                                    letterSpacing: 0.5),
                                              ),
                                              trailing:
                                                  checkBoxListTileModel[index]
                                                          .isCheck
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Colors.blue,
                                                        )
                                                      : null,
                                              selectedColor: Colors.blue,
                                              onTap: () {},
                                              onLongPress: () {},
                                            ),
                                          ),
                                          // CheckboxListTile(
                                          //     activeColor: Colors.pink[300],
                                          //     dense: true,
                                          //     //font change
                                          //     title:  Text(
                                          //       checkBoxListTileModel[index].title,
                                          //       style: const TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight: FontWeight.w600,
                                          //           letterSpacing: 0.5),
                                          //     ),
                                          //     value: checkBoxListTileModel[index].isCheck,
                                          //
                                          //     onChanged: (bool? val) => itemChange(val!, index)),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: const Icon(Icons.sort_outlined),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text("Status")
            ],
          ),
          const Text(" 4 results")
        ],
      ),
    );
  }
}

/* ------------------ SEARCH FIELD ------------------ */

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  void _clearSearch() {
    _controller.clear();
    // Optionally, you can also call setState if you want to trigger a UI update
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          contentPadding: const EdgeInsets.all(8),
          hintText: "Search by WO Name or Code",
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: const Icon(
            Icons.search,
            size: 30,
          ),
          prefixIconColor: Colors.grey.shade400,
          suffixIcon: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey),
            onPressed: _clearSearch,
          ),
        ),
      ),
    );
  }
}
/* ------------------ FILTER CHIPS ------------------ */

class Filterchips extends StatelessWidget {
  const Filterchips(
      {Key? key,
      this.isNeedDropdown = false,
      required this.sortOptions,
      required this.selectedCategories,
      required this.library,
      this.label})
      : super(key: key);
  final bool isNeedDropdown;
  final List<String> sortOptions;
  final ValueNotifier<Set<String>> selectedCategories;
  final Library library;
  final Widget? label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      // width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          const Visibility(
            visible: false,
            child: Positioned(
              // draw a red marble
              top: 0.0,
              right: 5.0,
              child:
                  Icon(Icons.brightness_1, size: 10.0, color: Colors.redAccent),
            ),
          ),
          const VerticalDivider(
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: sortOptions.length,
              itemBuilder: (BuildContext context, int index) {
                /* ------------------ Filter  Chips ------------------ */

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: isNeedDropdown
                        ? FilterChipWithDropDown<String>(
                            label: Text(
                              selectedCategories.value.isEmpty
                                  ? 'Category'
                                  : selectedCategories.value.first,
                            ),
                            value: selectedCategories.value.isEmpty
                                ? null
                                : selectedCategories.value.first,
                            items: [
                              const DropdownMenuItem(
                                  value: null, child: Text('all')),
                              for (final category in library.categories)
                                DropdownMenuItem(
                                    value: category, child: Text(category)),
                            ],
                            onChanged: (category) {
                              selectedCategories.value = {
                                if (category != null) category
                              };
                            },
                          )
                        : FilterChipWithOutDropdown(
                            label: Text(sortOptions[index])));
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ------------------ OTHER HELPERS ------------------ */

class Library {
  final List<String> categories;

  Library({required this.categories});
}

class CheckBoxListTileModel {
  String title;
  bool isCheck;
  CheckBoxListTileModel({required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(title: "Due Date", isCheck: false),
      CheckBoxListTileModel(title: "Asset", isCheck: false),
      CheckBoxListTileModel(title: "Status", isCheck: true),
      CheckBoxListTileModel(title: "Location", isCheck: false),

      // CheckBoxListTileModel(title: "Last Updated", isCheck: false),
      // CheckBoxListTileModel(title: "Newest", isCheck: false),
      // CheckBoxListTileModel(title: "Oldest", isCheck: false),
      // CheckBoxListTileModel(title: "Primary Worker", isCheck: false),
      // CheckBoxListTileModel(title: "Priority", isCheck: false),
      // CheckBoxListTileModel(title: "Team", isCheck: false),
    ];
  }
}
