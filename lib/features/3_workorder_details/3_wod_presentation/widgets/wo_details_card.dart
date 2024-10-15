import 'package:flutter/material.dart';

class WoPartsCard extends StatefulWidget {
  final String firstLine;
  final String secondLine;
  final String? thirdLine;
  final String buttonTitle;
  final IconData? icon;
  final String workOrderId;
  final Function()? onPressed;

  const WoPartsCard(
      {Key? key,
      required this.firstLine,
      required this.secondLine,
      this.thirdLine,
      required this.buttonTitle,
      this.icon,
      this.onPressed,
      required this.workOrderId})
      : super(key: key);

  @override
  State<WoPartsCard> createState() => _WoPartsCardState();
}

class _WoPartsCardState extends State<WoPartsCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Set elevation to 0 for a flat card
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Customize the border radius
        side: const BorderSide(
          color: Colors.grey, // Customize the border color
          width: 1.0, // Customize the border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 8, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.firstLine,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const Icon(
                      Icons.more_horiz_outlined,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.secondLine,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text(
                //   thirdLine ?? "",
                //   style: TextStyle(color: Colors.grey.shade600),
                // ),
              ],
            ),
          ),
          widget.buttonTitle != ''
              ? const Divider(
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                )
              : Container(),
          // const SizedBox(height:10),
          widget.buttonTitle != ''
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextButton(
                      onPressed: widget.onPressed,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.buttonTitle),
                          Icon(
                            widget.icon,
                            color: Colors.grey,
                          )
                        ],
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
