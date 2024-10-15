import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ShowSnack on SnackBar {
  void show(BuildContext context, {int durationInSeconds = 15}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(this);
    Future.delayed(Duration(seconds: durationInSeconds)).then((value) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
  }
}

SnackBar infoMessageSnackBar(BuildContext context, String message) {
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 200.0),
      dismissDirection: DismissDirection.none,
      content: SizedBox(
          height: 105,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: infoBoxDecoration(context),
              child: Text(message, style: infoTextStyle(context), textAlign: TextAlign.center),
            ),
          )));
}

SnackBar errorMessageSnackBar(BuildContext context, String title, String message) {
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 200.0),
      dismissDirection: DismissDirection.none,
      content: SizedBox(
          height: 105,
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: errorBoxDecoration(context),
                child: Column(
                  children: [
                    Text(title, style: errorTextStyle(context, bold: true)),
                    Expanded(child: Text(message, style: errorTextStyle(context))),
                  ],
                )),
          )));
}

Container waitingIndicator() {
  return Container(
    color: Colors.black.withOpacity(0.2),
    child: const Center(child: CircularProgressIndicator()),
  );
}

errorBoxDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return BoxDecoration(
      border: Border.all(color: Colors.black),
      color: theme.dialogBackgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)));
}

infoBoxDecoration(BuildContext context) {
  final theme = Theme.of(context);
  return BoxDecoration(
      border: Border.all(color: Colors.black),
      color: theme.dialogBackgroundColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)));
}

errorTextStyle(BuildContext context, {bool bold = false}) {
  final theme = Theme.of(context);
  return TextStyle(color: theme.focusColor, fontWeight: bold ? FontWeight.bold : FontWeight.normal);
}

infoTextStyle(BuildContext context, {bool bold = false}) {
  return TextStyle(color: Colors.black, fontWeight: bold ? FontWeight.bold : FontWeight.normal);
}

Future<bool?> toast(String message) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      // timeInSecForIos: 4,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 15.0);
}
