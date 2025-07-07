import 'package:flutter/material.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/app_assets.dart';
import 'package:islamy/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  int index;
  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImage),
            Text('${index + 1}', style: AppStyles.bold16White),
          ],
        ),
        SizedBox(width: width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranList[index],
              style: AppStyles.bold20White,
            ),
            Text(
              "${QuranResources.versesNumberList[index]}  Verses",
              style: AppStyles.bold14White,
            ),
          ],
        ),
        const Spacer(),
        Text(
          QuranResources.arabicQuranList[index],
          style: AppStyles.bold20White,
        ),
      ],
    );
  }
}
