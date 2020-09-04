import 'package:flutter/rendering.dart';
import 'package:mechat/config/Palette.dart';

class Styles {
  static TextStyle textHeading = TextStyle(
    color: Palette.primaryTextColor,
    fontSize: 20,
  );
  static TextStyle subHeading = TextStyle(
    color: Palette.primaryTextColor,
    fontSize: 14,
  );
  static TextStyle text = TextStyle(
    color: Palette.secondaryColor,
  );
  static TextStyle subText = TextStyle(
    color: Palette.greyColor,
  );
  static TextStyle date = TextStyle(
      color: Palette.greyColor, fontSize: 12, fontStyle: FontStyle.normal);
}
