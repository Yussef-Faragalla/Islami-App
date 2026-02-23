import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: height * 0.0858369098712446),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          children: [
            Image.asset(
              AppAssets.board1,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              AppAssets.board2,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              AppAssets.board3,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              AppAssets.board4,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              AppAssets.board5,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: height * 0.0858369098712446,
        color: AppColor.blackColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (currentPage != 0)
              TextButton(
                onPressed: () {
                  controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text('Back', style: AppStyle.jannaGold16bold),
              )
            else
              SizedBox(width: 60),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 5,
                effect: WormEffect(
                  activeDotColor: AppColor.goldColor,
                  dotColor: AppColor.grayColor,
                  dotHeight: 7,
                  dotWidth: 7,
                  radius: 7,
                  spacing: 10,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                if (currentPage < 4) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // حفظ ان المستخدم شاف الـ Onboarding
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('seenOnboarding', true);

                  // الانتقال للـ Home باستخدام named route
                  Navigator.pushReplacementNamed(context, AppRoute.homeScreen);
                }
              },
              child: Text(
                currentPage == 4 ? 'Start' : 'Next',
                style: AppStyle.jannaGold16bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
