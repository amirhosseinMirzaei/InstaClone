import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class DarktThemeColor {
  static const primaryColor = Colors.black;
  static const secondaryColor = Color(0xff141519);
  static const primaryTextColor = Colors.white;
  static const secondaryTextColor = Color(0xffCBCBCB);
  static const BottomSheetColor = Color(0xff26272C);
  static const begGradientColor = Color(0xffED78B7);
  static const toGradientColor = Color(0xffF37381);
  static const endGradientColor = Color(0xffF0A616);
}

final themeData = ThemeData(
  scaffoldBackgroundColor: DarktThemeColor.primaryColor,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: DarktThemeColor.primaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: DarktThemeColor.primaryTextColor),
      titleSmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: DarktThemeColor.secondaryTextColor),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 10,
          color: DarktThemeColor.primaryTextColor)),
);
