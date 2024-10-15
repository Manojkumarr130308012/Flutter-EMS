import 'package:flutter/material.dart';

ListTile buildListTile(
    {required String heading,
    required String subtitle,
    String? subtitle1,
    IconData? icon = Icons.more_horiz_outlined,
    Function()? onTap}) {
  return ListTile(
    onTap: onTap,
    contentPadding: EdgeInsets.zero,
    shape: Border.all(color: Colors.transparent), // Remove border
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          textAlign: TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Icon(icon),
      ],
    ),
    subtitle: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            subtitle1 ?? "",
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );
}

ListTile buildListTile2(
    {required String heading,
    required String subtitle,
    Function()? onTap,
    IconData? icon = Icons.more_horiz_outlined}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    shape: Border.all(color: Colors.transparent), // Remove border
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          textAlign: TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Icon(icon),
      ],
    ),
    subtitle: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
    onTap: onTap,
  );
}
