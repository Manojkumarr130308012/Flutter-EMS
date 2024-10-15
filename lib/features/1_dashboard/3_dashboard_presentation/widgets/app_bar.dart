import 'package:flutter/material.dart';

class OAppBar extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onPress;
  final IconData? qrIcon;
  final Function()? qrOnPress;

  final IconData? notificationIcon;
  final Function()? notificationOnPress;

  final bool titleCenter;
  final double elevation;
  final Widget? leadingIcon;
  const OAppBar({
    Key? key,
    this.title,
    this.icon,
    this.onPress,
    this.qrIcon,
    this.qrOnPress,
    this.notificationIcon,
    this.notificationOnPress,
    this.titleCenter = true,
    this.elevation = 0,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingIcon,
      iconTheme: const IconThemeData(
        color: Colors.blue, //change your color here
      ),
      centerTitle: titleCenter,
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      title: Text(
        title ?? "",
        style: const TextStyle(color: Colors.black),
      ),
      elevation: elevation,
      // backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Icon(
            qrIcon,
            color: Colors.black,
          ), // QRIcon
          onPressed: qrOnPress,
        ),
        IconButton(
          icon: Icon(
            notificationIcon,
            color: Colors.black,
          ),
          onPressed: notificationOnPress,
        ), // NotificationIcon
        IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          // tooltip: 'Settings',
          onPressed: onPress,
        ),
      ],
    );
  }
}
