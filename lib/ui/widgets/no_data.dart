// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:todoapp/resources/assests_manager.dart';
import 'package:todoapp/resources/color_manager.dart';
import 'package:todoapp/resources/font_manager.dart';
import 'package:todoapp/resources/style_manager.dart';

class NoData extends StatelessWidget {
  String title;
  NoData(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120.0,
            child: Image.asset(
              ImageAssets.oopsLogo,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: getRegularStyle(
                  color: ColorManager.error, fontSize: FontSizes.s17),
            ),
          )
        ],
      ),
    );
  }
}
