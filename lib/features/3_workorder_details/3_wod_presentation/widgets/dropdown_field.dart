import 'package:flutter/material.dart';

class MyDropdownField extends StatefulWidget {
  const MyDropdownField({super.key});

  @override
  _MyDropdownFieldState createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<MyDropdownField> {
  bool isDropdownOpen = false;
  String? selectedValue;

  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  void selectOption(String option) {
    setState(() {
      selectedValue = option;
      isDropdownOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: toggleDropdown,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  selectedValue ?? 'Select an option',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ),
          if (isDropdownOpen)
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              margin: EdgeInsets.only(top: 4.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(options[index]),
                    onTap: () {
                      selectOption(options[index]);
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
