import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami_app/Home/Tabs/hadeth/hadeth.dart';
import 'package:islami_app/Home/Tabs/quran/quran.dart';
import 'package:islami_app/Home/Tabs/radio/radioo.dart';
import 'package:islami_app/Home/Tabs/sebha/sebha.dart';
import 'package:islami_app/Home/Tabs/time/time.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;
List<String> backgrounds=[

  AppAssets.quranBg,AppAssets.hadethBg,
  AppAssets.sebhaBg,AppAssets.radioBg,AppAssets.timeBg
];
List<Widget> pages=[
  Quran(),Hadeth(),Sebha(),Radioo(),Time()
];
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(backgrounds[selectedIndex],
          fit:BoxFit.fill ,
        width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
bottomNavigationBar: Theme(

  data: Theme.of(context).copyWith(
    canvasColor: AppColor.goldColor
  ),
  child: BottomNavigationBar(
onTap: (value) {
setState(() {
  selectedIndex=value;
});

},
      currentIndex: selectedIndex,
      items:
  [
    buildButtomNavBarItem(iconName: AppAssets.iconQuran, labelName: "Quran",index: 0, ),
    buildButtomNavBarItem(iconName: AppAssets.iconHadeth, labelName: "Hadith",index: 1,),
    buildButtomNavBarItem(iconName: AppAssets.iconSebha, labelName: "Sebha",index: 2,),
    buildButtomNavBarItem(iconName: AppAssets.iconRadio, labelName: "Radio",index: 3,),
    buildButtomNavBarItem(iconName: AppAssets.iconTime, labelName: "Time",index: 4,),

  ]
  ),
),
          body: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: height*0.19,
                  child: Image.asset(AppAssets.logoIslami)),
              Expanded(child: pages[selectedIndex]),
            ],
          ),
        )

      ],
    );
  }

   BottomNavigationBarItem buildButtomNavBarItem({
    required int index,required String iconName, required String labelName
}){
    return  BottomNavigationBarItem
      (icon:selectedIndex==index? Container(
        padding: EdgeInsets.symmetric(vertical: 7,horizontal: 20),
decoration: BoxDecoration(
  color: AppColor.blackBgColor,
borderRadius: BorderRadius.circular(66)
),        
        child: ImageIcon(AssetImage(iconName))): ImageIcon(AssetImage(iconName)),
        label: labelName);


   }
}
