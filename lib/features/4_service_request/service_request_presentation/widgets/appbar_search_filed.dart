import 'package:flutter/material.dart';

/////////////////////////// SEARCH FIELD \\\\\\\\\\\\\\\\\\\\\\\\\\

class AppBarSearchField extends StatelessWidget {
  final String title;
  const AppBarSearchField({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            isDense: true, // Added this
            contentPadding: const EdgeInsets.all(8),
            hintText: title,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
            ),
            prefixIconColor: Colors.grey.shade400),
      ),
    );
  }
}

// /// Function used for search functionality
// void _searchWorkOrder(String enteredKeyword) {
//   List<WorkorderEntity>? results = [];
//   if (enteredKeyword.isEmpty) {
//     results = widget.workOrders;
//   } else {
//     results = widget.workOrders
//         .where(
//           (element) =>
//               element.workOrderName!.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
//               element.workOrderCode!.toLowerCase().contains(enteredKeyword.toLowerCase()),
//         )
//         .toList();
//   }
//   setState(() {
//     _foundWorkOrder = results!;
//   });
// }
