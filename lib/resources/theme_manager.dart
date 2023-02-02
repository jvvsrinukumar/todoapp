import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'style_manager.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.itemBackground,
    disabledColor: ColorManager
        .grey1, // will be used incase of disabled button for example

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey1,
      elevation: AppSize.s8,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.backGround,
        elevation: AppSize.s8,
        //shadowColor: ColorManager.white,
        titleTextStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSizes.s25)),

//    bottomNavigationBarTheme: BottomNavigationBarTheme(
//
//    ),

    // Button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        splashColor: ColorManager.grey,
        buttonColor: ColorManager.textColor),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getSemiBoldStyle(
                fontSize: FontSizes.s16, color: ColorManager.textColor),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s0)))),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.buttonColor,
      focusColor: Colors.blue,
      foregroundColor: ColorManager.white,
      hoverColor: Colors.green,
      splashColor: ColorManager.grey,
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.fromLTRB(
      //     AppPadding.p18, AppPadding.p16, AppPadding.p18, AppPadding.p16),
      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey1),

      // label style
      labelStyle: getRegularStyle(color: ColorManager.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      fillColor: ColorManager.todoBackground,
      filled: true,
      // enabled border
        //  enabledBorder: const UnderlineInputBorder(
        //                     borderSide: BorderSide(
        //                         color: Colors.white24), //<-- SEE HERE
        //                   ),

      // // focused border
      // focusedBorder: OutlineInputBorder(
      //     //contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      //     borderSide: BorderSide(color: ColorManager.appBarTop),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))),

      // // error border
      // errorBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: ColorManager.error),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12))),
      // // focused error border
      // focusedErrorBorder: OutlineInputBorder(
      //     borderSide: BorderSide(color: ColorManager.error),
      //     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
