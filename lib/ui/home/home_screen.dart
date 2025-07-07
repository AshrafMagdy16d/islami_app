import 'package:flutter/material.dart';
import 'package:islamy/ui/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islamy/ui/home/tabs/quran/quran_tab.dart';
import 'package:islamy/ui/home/tabs/radio/radio_tab.dart';
import 'package:islamy/ui/home/tabs/sebha/sebha_tab.dart';
import 'package:islamy/ui/home/tabs/time/time_tab.dart';
import 'package:islamy/utils/app_assets.dart';
import 'package:islamy/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgrounds = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgrounds[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,

            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },

            items: [
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 0,
                  imageName: AppAssets.iconQuran,
                ),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 1,
                  imageName: AppAssets.iconHadeth,
                ),
                label: 'Hadeth',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 2,
                  imageName: AppAssets.iconSebha,
                ),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 3,
                  imageName: AppAssets.iconRadio,
                ),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: builtBottomNavigationBar(
                  index: 4,
                  imageName: AppAssets.iconTime,
                ),
                label: 'Time',
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavigationBar({
    required int index,
    required String imageName,
  }) {
    return selectedIndex == index
        ? Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.blackBgColor,
          ),
          child: ImageIcon(AssetImage(imageName)),
        )
        : ImageIcon(AssetImage(imageName));
  }
}
