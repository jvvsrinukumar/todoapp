import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#FFFFFF");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");

  ///164762

  static Color appBarBackground = HexColor.fromHex("#7790CC"); //2D778E
  static Color appBarTop = HexColor.fromHex("#8CA1D5");
  static Color itemBackground = HexColor.fromHex("#DFE9EC"); //F2F2F2


  static Color buttonColor = HexColor.fromHex("#51C0CE");
  static Color textColor = HexColor.fromHex("#45403C");
  static Color backGround = HexColor.fromHex("#faf8f4");
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#ffad3f");//HexColor.fromHex("#e61f34"); // red color
  static Color black = HexColor.fromHex("#000000");
  static Color green = Colors.green;

  static Color todoBackground = HexColor.fromHex("#46539E");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
