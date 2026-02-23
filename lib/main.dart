import 'package:flutter/material.dart';
import 'package:islami_app/Home/Tabs/quran/Details/sura_details.dart';
import 'package:islami_app/Home/Tabs/quran/Details/sura_details1.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_themes.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:AppRoute.homeScreen,
      routes: {
        AppRoute.homeScreen:(context)=>HomeScreen(),
        AppRoute.suraDetails:(context)=>SuraDetails(),
      },
      debugShowCheckedModeBanner: false,
darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,

    );
  }
}
