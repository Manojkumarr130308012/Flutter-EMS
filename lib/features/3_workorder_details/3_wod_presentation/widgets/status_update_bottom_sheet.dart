import 'package:flutter/material.dart';

typedef StringCallback = void Function(String id);

class StatusUpdateSheetBottom2 extends StatefulWidget {
  const StatusUpdateSheetBottom2({
    super.key,
    required this.checkBoxListTileModel,
    required this.selectedItem,
    required this.selectedStatus,
  });

  final List<WorkOrderStatusUpdateModel2> checkBoxListTileModel;
  final StringCallback selectedItem;
  final String selectedStatus;
  @override
  State<StatusUpdateSheetBottom2> createState() => _StatusUpdateSheetBottom2State();
}

class _StatusUpdateSheetBottom2State extends State<StatusUpdateSheetBottom2> {
  @override
  Widget build(BuildContext context) {
    String selectedText = "";
    void _updateCheckIndex(int index) {
      setState(() {
        for (var i = 0; i < widget.checkBoxListTileModel.length; i++) {
          widget.checkBoxListTileModel[i].isCheck = (i == index);
        }
        widget.selectedItem(widget.checkBoxListTileModel[index].title);
        selectedText = widget.checkBoxListTileModel[index].title;
        print(selectedText);
      });
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height * .38,
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
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "Update Status",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Divider(),

            /* ------------------ List View ------------------ */

            Expanded(
              child: ListView.separated(
                  itemCount: widget.checkBoxListTileModel.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 35,
                      child:
                          // Center(
                          //   child: ListTile(
                          //     visualDensity: const VisualDensity(vertical: -4),
                          //     leading: checkBoxListTileModel[index].icon,
                          //     titleAlignment: ListTileTitleAlignment.center,
                          //     title: Text(
                          //       checkBoxListTileModel[index].title,
                          //       style: const TextStyle(
                          //           fontSize: 14,
                          //           // fontWeight:
                          //           //     FontWeight
                          //           //         .w600,
                          //           letterSpacing: 0.5),
                          //     ),
                          //     trailing: checkBoxListTileModel[index].isCheck
                          //         ? const Icon(
                          //       Icons.check,
                          //       color: Colors.blue,
                          //     )
                          //         : null,
                          //     selectedColor: Colors.blue,
                          //     onTap: () {},
                          //     onLongPress: () {},
                          //   ),
                          // ),
                          CheckboxListTile(
                        checkColor: Colors.blue,
                        side: BorderSide.none,
                        activeColor: Colors.transparent,
                        dense: true,
                        title: Row(
                          children: [
                            widget.checkBoxListTileModel[index].icon,
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.checkBoxListTileModel[index].title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                            ),
                          ],
                        ),
                        value: widget.checkBoxListTileModel[index].isCheck,
                        onChanged: (bool? value) {
                          _updateCheckIndex(index);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkOrderStatusUpdateModel2 {
  String title;
  String value;
  bool isCheck;
  Icon icon;
  WorkOrderStatusUpdateModel2(
      {required this.title, required this.isCheck, required this.value, required this.icon});

  static List<WorkOrderStatusUpdateModel2> getUsers() {
    return <WorkOrderStatusUpdateModel2>[
      WorkOrderStatusUpdateModel2(
        title: "New",
        value: "NEW",
        isCheck: false,
        icon: const Icon(
          Icons.circle_outlined,
          color: Colors.purple,
        ),
      ),
      WorkOrderStatusUpdateModel2(
        title: "In Progress",
        value: "INPRG",
        isCheck: false,
        icon: const Icon(
          Icons.play_circle_outline_outlined,
          color: Colors.blue,
        ),
      ),
      WorkOrderStatusUpdateModel2(
        title: "Stop",
        value: "STP",
        isCheck: false,
        icon: const Icon(
          Icons.pause_circle_outline_outlined,
          color: Colors.green,
        ),
      ),
      WorkOrderStatusUpdateModel2(
        title: "Completed",
        value: "COMP",
        isCheck: false,
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.red,
        ),
      ),
    ];
  }
}
