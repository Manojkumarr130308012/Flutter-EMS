import 'package:flutter/material.dart';

/////////////////////////// APP BAR \\\\\\\\\\\\\\\\\\\\\\\\\\

class WODAppBar extends StatelessWidget {
  const WODAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      automaticallyImplyLeading: false,
      elevation: 0,
      leadingWidth: 90,
      leading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.blue),
            onPressed: () {
              Navigator.pop(context);
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
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.info_outlined),
      //     color: Colors.grey,
      //   ),
      //   IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.more_horiz_outlined, color: Colors.grey),
      //   ),
      // ],
    );
  }
}
