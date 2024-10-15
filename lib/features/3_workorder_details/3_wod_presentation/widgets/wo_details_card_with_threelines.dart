import 'package:flutter/material.dart';

/////////////////////////// WORK ORDER DETAILS CARD WITH THREE LINES \\\\\\\\\\\\\\\\\\\\\\\\\\

class WoDetailsCardWithThreeLine extends StatelessWidget {
  final String firstLine;
  final String secondLine;

  final String buttonTitle;
  final IconData? icon;

  const WoDetailsCardWithThreeLine(
      {Key? key,
      required this.firstLine,
      required this.secondLine,
      required this.buttonTitle,
      this.icon})
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
                Text(
                  secondLine,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
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
                onPressed: () {},
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
