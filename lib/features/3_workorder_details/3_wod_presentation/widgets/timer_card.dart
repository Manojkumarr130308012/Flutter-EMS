import 'package:flutter/material.dart';

/////////////////////////////////////////////////////////////
/// TIMER CARD
/////////////////////////////////////////////////////////////

class TimerCard extends StatelessWidget {
  final String firstLine;
  final Widget timeFields;
  final String? thirdLine;
  final String buttonTitle;
  final IconData? icon;
  final Function()? onPressed;

  const TimerCard(
      {Key? key,
      required this.firstLine,
      required this.timeFields,
      this.thirdLine,
      required this.buttonTitle,
      this.icon,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 16.0, bottom: 8, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstLine,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(
                  height: 10,
                ),
                timeFields,
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),

          const Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          // const SizedBox(height:10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(buttonTitle),
                    Icon(
                      icon,
                      color: Colors.grey,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
