// const String eamAPIBaseURL = 'https://eamapi.s2tsoft.com/api';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 'https://demoapi.orienseam.com/api'
String eamAPIBaseURL = 'https://demoapi.orienseam.com/api';

final token = "";

// Use in Dashboard HOME BOTTOM Widget
List<Color> colors = [
  Colors.blueAccent,
  Colors.pinkAccent,
  Colors.green,
  Colors.redAccent,
  Colors.deepOrangeAccent,
  Colors.cyan,
  Colors.blueGrey
];

List<IconData> icons = [
  const IconData(0xeb7b, fontFamily: 'MaterialIcons'),
  const IconData(0xe2a4, fontFamily: 'MaterialIcons'),
  const IconData(0xe325, fontFamily: 'MaterialIcons'),
  const IconData(0xe607, fontFamily: 'MaterialIcons'),
  const IconData(0xe122, fontFamily: 'MaterialIcons'),
  const IconData(0xe23e, fontFamily: 'MaterialIcons'),
  const IconData(0xe159, fontFamily: 'MaterialIcons'),
];

String twoDigits(int n) => n.toString().padLeft(2, '0');

// double height = MediaQuery.of(context).size.height;
// double width = MediaQuery.of(context).size.width;

// if (state is WorkorderLoading) {
// return const Center(child: CupertinoActivityIndicator());
// }
//
// if (state is WorkorderError) {
// return const Center(child: Icon(Icons.refresh));
// }

@immutable
class ColorConstants {
  const ColorConstants._();

  static const Color black = Color(0xFF252525);
  static const Color teal = Color(0xff37A492);
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

class OriensSnackBar extends StatelessWidget {
  final String error;
  const OriensSnackBar({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
    );
  }
}

@immutable
class StringConstants {
  const StringConstants._();

  static const String appName = 'Bloc Auth';

  /// for BASE URL view
  static const String urlTitle = "URL";

  /// for Login view
  static const String loginTitle = "You can log in with your information.";
  static const String loginButtonText = "LOGIN";
  static const String emailTitle = "Email";
  static const String passwordTitle = "Password";
  static const String emailHint = 'example@gmail.com';
  static const String passwordHint = '···········';

  /// for Home view
  static const String homePage = 'Home Page';

  /// for validators
  static const String requiredField = "Required field";
  static const String makeSureCorrectMail =
      "Please make sure you enter the correct email.";
}

class Constants {
  static Future<bool> saveBaseURL(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("Check thisssss" + value);
    sharedPreferences.setString('eamAPIBaseURL', value);

    return await sharedPreferences.setString("eamAPIBaseURL", value);
  }

// Read Data
  static Future getBaseURL() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("get thisssss" + sharedPreferences.getString("eamAPIBaseURL")!);
    return await sharedPreferences.getString('eamAPIBaseURL') ?? '';
  }
}
