import 'package:flutter/cupertino.dart';
import 'package:islami_app/modle/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraItemWidget extends StatelessWidget {
 final int index;
   SuraItemWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width*0.06,
      children: [
        Stack(
          alignment: AlignmentGeometry.center,
          children: [
            Image.asset(AppAssets.img_vector),
            Text('${index + 1}',style: AppStyle.jannaWhite15bold,),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(QuranResources.englishQuranSurahList[index],style: AppStyle.jannaWhite20bold,),
            Text('${QuranResources.versesNumber[index]} Verses',style: AppStyle.jannaWhite14bold,),
          ],
        ),
        Spacer(),
        Text(QuranResources.arabicQuranSuraList[index],style: AppStyle.jannaWhite20bold,)
      ],
    );
  }
}
