import 'package:flutter/material.dart';

class AssetDetailsRichText extends StatelessWidget {
  final String heading;
  final String detail;

  const AssetDetailsRichText({
    super.key,
    required this.heading,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: heading,
          style: TextStyle(
            color: Colors.grey.shade400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: detail,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )
          ]),
    );
  }
}
