import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Home/Tabs/quran/Details/widget/show_modle_bottom_sheet_quran.dart';
import 'package:islami_app/Home/Tabs/quran/Details/widget/sura_content.dart';
import 'package:islami_app/modle/quran_resources.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];
  int? selectedVerseIndex;

  @override
  Widget build(BuildContext context) {
     final args=ModalRoute.of(context)?.settings.arguments as Map;
    String shape=args['shape'];
    int index = args['index'];
    // int index = ModalRoute.of(context)?.settings.arguments as int;
    double height = MediaQuery.of(context).size.height;
    int suraIndex = index;
    double width = MediaQuery.of(context).size.width;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.goldColor),
        backgroundColor: AppColor.blackColor,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        title: Text(
          QuranResources.englishQuranSurahList[index],
          style: AppStyle.jannaGold20bold,
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.blackColor,
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Image.asset(
            AppAssets.detailsBg,
            width: double.infinity,
            fit: BoxFit.fill,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicQuranSuraList[index],
                  style: AppStyle.jannaGold24bold,
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                  style: AppStyle.jannaGold24bold,
                ),
                SizedBox(height: height * 0.019),
                Expanded(
                  child:shape=="shape1"?
                  verses.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.02),
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: List.generate(
                            verses.length,
                                (index) {
                              bool isSajda =
                                  QuranResources.sajdaVerses[suraIndex + 1]
                                      ?.contains(index + 1) ??
                                      false;

                              return TextSpan(
                                text: verses[index] + " ",
                                style: AppStyle.jannaGold20bold.copyWith(  height: 2,
                                    fontSize:22
                                ),
                                children: [
                                  if (isSajda)
                                    TextSpan(
                                      text: "۩ ",
                                      style: AppStyle.jannaGold20bold.copyWith(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 36
                                      ),
                                    ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.verses_numbers,
                                          color: AppColor.goldColor,
                                        ),
                                        Text(
                                          '${index + 1}',
                                          style: AppStyle.jannaGold20bold.copyWith(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextSpan(text: " "), // مسافة بين كل آية
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                      : ListView.separated(
                    itemBuilder: (context, index) {
                      return verses.isEmpty
                          ? Center(child: CircularProgressIndicator())
                          : SuraContent(
                        content: verses[index],
                        verses: index + 1,
                        suraIndex: suraIndex,
                        isSelected:selectedVerseIndex==index,
                        onTap: () {
                          setState(() {
                            selectedVerseIndex=index;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: height * 0.008);
                    },
                    itemCount: verses.length,
                  )
                ),
                SizedBox(height: height * 0.12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContact = await rootBundle.loadString(
      "assets/Suras/${index + 1}.txt",
    );
    List<String> lines = fileContact
        .split('\n')
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();
    ;
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

