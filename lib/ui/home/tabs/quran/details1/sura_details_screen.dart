import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/home/tabs/quran/details1/sura_content_item.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/app_assets.dart';
import 'package:islamy/utils/app_colors.dart';
import 'package:islamy/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'sura-details';

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
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
                      verses.isEmpty
                          ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                          : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return SizedBox(height: height * 0.01);
                            },
                            itemBuilder:
                                (context, index) => SuraContentItem(
                                  suraContent: verses[index],
                                  index: index,
                                ),
                            itemCount: verses.length,
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

    verses = lines;
    Future.delayed(const Duration(seconds: 1), () => setState(() {}));
  }
}
