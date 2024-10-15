import 'package:flutter/material.dart';

class CircleAvatorButton extends StatelessWidget {
  final IconData icon;
  final Function()? onPress;
  final String label;
  final bool show;

  const CircleAvatorButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.label,
    this.show = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              child: IconButton(
                icon: Icon(
                  icon,
                  color: Colors.black,
                ),
                onPressed: onPress,
              ),
            ),
            Visibility(
              visible: show,
              child: const Positioned(
                // draw a red marble
                right: 5.0,
                child: Icon(Icons.brightness_1,
                    size: 10.0, color: Colors.redAccent),
              ),
            )
          ],
        ),
      ],
    );
  }
}
