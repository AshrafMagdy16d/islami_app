import 'package:flutter/material.dart';
import 'package:islamy/utils/app_colors.dart';
import 'package:islamy/utils/app_styles.dart';

class SuraContentItem2 extends StatelessWidget {
  String suraContent;

  SuraContentItem2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Text(
      suraContent,
      textDirection: TextDirection.rtl,
      style: AppStyles.bold20Primary,
      textAlign: TextAlign.center,
    );
  }
}
