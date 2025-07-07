import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/home/tabs/quran/details2/sura_content_item2.dart';

import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/app_assets.dart';
import 'package:islamy/utils/app_colors.dart';
import 'package:islamy/utils/app_styles.dart';

class SuraDetails2 extends StatefulWidget {
  static const String routeName = 'sura-details2';

  SuraDetails2({super.key});

  @override
  State<SuraDetails2> createState() => _SuraDetails2State();
}

class _SuraDetails2State extends State<SuraDetails2> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(title: Text(QuranResources.englishQuranList[index])),
      body: SafeArea(
        child: Container(
          color: AppColors.blackBgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppAssets.cornerLeft),
                    Text(
                      QuranResources.arabicQuranList[index],
                      style: AppStyles.bold24Primary,
                    ),
                    Image.asset(AppAssets.cornerRight),
                  ],
                ),

                SizedBox(height: height * 0.02),
                Expanded(
                  child:
                      suraContent.isEmpty
                          ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                          : SingleChildScrollView(
                            child: SuraContentItem2(suraContent: suraContent),
                          ),
                ),
                Image.asset(AppAssets.mosque),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}]';
    }
    suraContent = lines.join();

    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
