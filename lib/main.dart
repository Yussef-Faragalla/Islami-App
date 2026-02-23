import 'package:flutter/material.dart';
import 'package:islami_app/Home/Tabs/quran/Details/sura_details.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  runApp(MyApp(seenOnboarding: seenOnboarding));
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;

  const MyApp({super.key, required this.seenOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: seenOnboarding
          ? AppRoute.homeScreen
          : AppRoute.OnBoardingScreen,
      routes: {
        AppRoute.homeScreen: (context) => HomeScreen(),
        AppRoute.suraDetails: (context) => SuraDetails(),
        AppRoute.OnBoardingScreen: (context) => OnBoardingScreen(),
      },
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
