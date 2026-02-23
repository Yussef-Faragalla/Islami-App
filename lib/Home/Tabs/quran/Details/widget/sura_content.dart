import 'package:flutter/cupertino.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

import '../../../../../modle/quran_resources.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int verses;
  final int suraIndex;
  final bool isSelected;
  final VoidCallback onTap;

  const SuraContent({
    super.key,
    required this.content,
    required this.verses,
    required this.suraIndex,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isSajda =
        QuranResources.sajdaVerses[suraIndex + 1]?.contains(verses) ?? false;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.03,
        ),
        decoration: BoxDecoration(
          color: isSelected?AppColor.goldColor:AppColor.transparentColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColor.goldColor, width: 2),
        ),
        child: RichText(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: content + " ",
                style: isSelected?AppStyle.jannaGold20bold.copyWith(
                    color: AppColor.blackColor
                ): AppStyle.jannaGold20bold,
                children: [
                  if (isSajda)
                    TextSpan(
                      text: "۩ ",
                      style: isSelected? AppStyle.jannaGold20bold.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 36,
                          color: AppColor.blackColor
                      ):AppStyle.jannaGold20bold.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                ],
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Stack(
                  alignment: AlignmentGeometry.center,
                  children: [
                    Image.asset(
                        AppAssets.verses_numbers,
                        // width: width * 0.09,
                        // height: height * 0.06,
                        color:isSelected?AppColor.blackColor:AppColor.goldColor,
                          ),
                    Text(
                      '$verses',
                      style:isSelected?
                      AppStyle.jannaGold20bold.copyWith(fontSize: 18,color: AppColor.blackColor):
                      AppStyle.jannaGold20bold.copyWith(fontSize: 18)
                      ,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

