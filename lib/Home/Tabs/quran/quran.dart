import 'package:flutter/material.dart';
import 'package:islami_app/modle/quran_resources.dart';
import 'package:islami_app/modle/sura_item_widget.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_style.dart';

import 'Details/widget/show_modle_bottom_sheet_quran.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  String currentShape = 'shape1';
  List<int> filterList = List.generate(114, (int index) => index);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          TextField(
            onChanged: (newText) {
              searchByNewsSura(newText);
            },
            cursorColor: AppColor.goldColor,
            style: AppStyle.jannaWhite16bold,
            decoration: InputDecoration(
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.iconQuran),
                color: AppColor.goldColor,
              ),
              enabledBorder: buildDecoratinBoard(context),
              focusedBorder: buildDecoratinBoard(context),
              hintText: "Sura Name",
              hintStyle: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Text("Most Recently", style: AppStyle.jannaWhite16bold),
              Spacer(),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setModalState) {
                          return ShowModleBottomSheetQuran(
                            selectedShape: currentShape,
                            onShapeSelected: (val) {
                              setModalState(() {
                                currentShape = val;
                              });
                              setState(() {});
                            },
                          );
                        },
                      );
                    },
                  );
                },
                icon: Icon(Icons.settings),
                color: AppColor.goldColor,
                iconSize: width * 0.08,
              ),
            ],
          ),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 114,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  decoration: BoxDecoration(
                    color: AppColor.goldColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        spacing: height * 0.011,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            QuranResources.englishQuranSurahList[index],
                            style: AppStyle.jannaBlack24bold,
                          ),
                          Text(
                            QuranResources.arabicQuranSuraList[index],
                            style: AppStyle.jannaBlack24bold,
                          ),
                          Text(
                            '${QuranResources.versesNumber[index]} Verses',
                            style: AppStyle.jannaBlack14bold,
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.img_most_recent),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: width * 0.0232);
              },
            ),
          ),
          Text("Suras List", style: AppStyle.jannaWhite16bold),
          Expanded( child:(filterList.isEmpty) ?  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Not Found Sura",style: AppStyle.jannaGold20bold,),
        Text("لا توجد سورة",style: AppStyle.jannaGold20bold,),
      ],
    ))
    :
             ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoute.suraDetails,
                      arguments: {'index': filterList[index], 'shape': currentShape},
                    );
                  },
                  child: SuraItemWidget(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColor.whiteColor,
                  thickness: 1.1,
                  indent: width * 0.12,
                  endIndent: width * 0.12,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildDecoratinBoard(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColor.goldColor, width: width * 0.005),
    );
  }

  void searchByNewsSura(String newText) {
    List<int> filterListSearch=[];
    for(int i=0;i<QuranResources.englishQuranSurahList.length;i++)
      {
        if(QuranResources.englishQuranSurahList[i].toLowerCase().contains(newText.toLowerCase())){
          filterListSearch.add(i);
        }
      }
    for(int i=0;i<QuranResources.arabicQuranSuraList.length;i++)
    {
      if(QuranResources.arabicQuranSuraList[i].toLowerCase().contains(newText.toLowerCase())){
        filterListSearch.add(i);
      }
    }
setState(() {
  filterList=filterListSearch;

});  }
}
