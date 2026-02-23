import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Home/Tabs/hadeth/widget/hadeth_item.dart';

class Hadeth extends StatelessWidget {
  const Hadeth ({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(height: height*0.66,
      enlargeCenterPage: true,
        aspectRatio: 313.34/618,
enableInfiniteScroll: false,
      ),
      items:
      List.generate(50, (index) =>index+1).map(
              (index) {
        return HadethItem(index: index,);
      }).toList(),
    );
  }
}
