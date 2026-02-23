import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  double angle = 0;
  int sebhaCounter = 0;
  int index = 0;
  List<String> zaker=['سبحان الله','الحمد لله','الله أكبر','استغفر الله'];
  List<int> zakerCount=[33,33,34,100];


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.017),
          child: Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: AppStyle.jannaWhite36bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              sebhaCounter++;
              if (sebhaCounter > zakerCount[index]){
                sebhaCounter = 0 ; index++;
              }
            });

            setState(() {
              angle += 30 * pi / 180;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppAssets.sebhaHead),
                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(AppAssets.sebhaBody),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: height * 0.075),
                  Text(zaker[index], style: AppStyle.jannaWhite36bold),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$sebhaCounter ',
                        style: AppStyle.jannaWhite36bold,
                      ),
                      Text(
                        '/ ${zakerCount[index]}',
                        style: AppStyle.jannaWhite36bold.copyWith(color: AppColor.goldColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
