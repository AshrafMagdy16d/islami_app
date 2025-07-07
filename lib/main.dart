import 'package:flutter/material.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/home/tabs/quran/details1/sura_details_screen.dart';
import 'package:islamy/ui/home/tabs/quran/details2/sura_details_screen2.dart';
import 'package:islamy/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        SuraDetails2.routeName: (context) => SuraDetails2(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
