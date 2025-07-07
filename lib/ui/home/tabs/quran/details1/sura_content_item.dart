import 'package:flutter/material.dart';
import 'package:islamy/utils/app_colors.dart';
import 'package:islamy/utils/app_styles.dart';

class SuraContentItem extends StatelessWidget {
  String suraContent;
  int index;
  SuraContentItem({super.key, required this.suraContent, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Text(
        '$suraContent[${index + 1}] ',
        textDirection: TextDirection.rtl,
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
      ),
    );
  }
}
