
import 'package:flutter/material.dart';

import 'font_manager.dart';


// ignore: non_constant_identifier_names
TextStyle _getTextStyle(double FontSize , String fontFamily, FontWeight  fontWeight, Color color) {
  return
    TextStyle(
        fontSize: FontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
    );
}



// regular style

TextStyle getRegularStyle({double fontSize = FontSizes.s12 , required Color color}) {
  //return TextStyle(FontSizes: FontSizes, fontFamily : FontConstants.fontFamily,color: color);
  return _getTextStyle(fontSize, FontConstants.fontFamily2, FontWeightManager.regular,color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSizes.s12 , required Color color}) {
  //return TextStyle(FontSizes: FontSizes, fontFamily : FontConstants.fontFamily,color: color);
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold,color);
}

// light style

TextStyle getLightStyle({double fontSize = FontSizes.s12 , required Color color}) {
  //return TextStyle(FontSizes: FontSizes, fontFamily : FontConstants.fontFamily,color: color);
  return _getTextStyle(fontSize, FontConstants.fontFamily2, FontWeightManager.semiBold,color);
}

// light style

TextStyle getSemiBoldStyle({double fontSize = FontSizes.s12 , required Color color}) {
  //return TextStyle(FontSizes: FontSizes, fontFamily : FontConstants.fontFamily,color: color);
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.semiBold,color);
}


TextStyle getMediumStyle({double fontSize = FontSizes.s12 , required Color color}) {
  //return TextStyle(FontSizes: FontSizes, fontFamily : FontConstants.fontFamily,color: color);
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.medium,color);
}