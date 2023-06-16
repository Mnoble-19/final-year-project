import 'package:flutter/material.dart';

class CustomColors {
  static Color get appDarkGreenColor => const Color(0xff278A45);

  static Color get appBackgroundColor => const Color(0xff71BF89);

  static Color get appLightGreenColor => const Color(0xff9CBDA6);

  static Color get appTransluscentGreenColor => const Color(0xffDEEEE3);
}

class CustomTextStyle {
  static TextStyle? bodyText1(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontFamily: 'HKGrotesk',
          fontSize: 24.0,
          fontWeight: FontWeight.w400,
          height: 31.27,
        );
  }
}

TextStyle greetingTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.8),
  fontWeight: FontWeight.bold,
  fontSize: 24.0,

);

TextStyle largeTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.8),
  fontWeight: FontWeight.w500,
  fontSize: 100.0,

);

TextStyle regularBodyTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.8),
  fontWeight: FontWeight.normal,
  fontSize: 16.0,

);

TextStyle mediumBodyTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.8),
  fontWeight: FontWeight.w500,
  fontSize: 16.0,

);

TextStyle boldBodyTextStyle = TextStyle(
  color: Colors.black.withOpacity(0.8),
  fontWeight: FontWeight.bold,
  fontSize: 16.0,

);