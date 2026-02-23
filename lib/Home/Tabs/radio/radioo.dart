import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Home/Tabs/radio/widget/radio_item.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Radioo extends StatefulWidget {
   Radioo ({super.key});

  @override
  State<Radioo> createState() => _RadiooState();
}

class _RadiooState extends State<Radioo> {
   int isSelected=0;

List<String> radioNames=['Radio Ibrahim Al-Akdar','Radio Al-Qaria Yassen',
  'Radio Ahmed Al-trabulsi','Radio Addokali Mohammad Alalim'
];

   List<String> recitersNames=['Ibrahim Al-Akdar','Akram Alalaqmi',
   'Majed Al-Enezi','Malik shaibat Alhamed'
   ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.0465116279069767),
      child: Column(
        children: [
          ToggleSwitch(
            minWidth: width*0.9069767441860465,
            minHeight: height*0.0429184549356223,
            fontSize: 16.0,
            initialLabelIndex: isSelected,
            activeBgColor: [AppColor.goldColor],
            activeFgColor: AppColor.blackColor,
            radiusStyle: true,
            customTextStyles: [
              TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ],
            inactiveBgColor: AppColor.blackColor_70,
            inactiveFgColor:AppColor.whiteColor,
            totalSwitches: 2,
      cornerRadius: 12,
            labels: ['Radio', 'Reciters'],
            onToggle: (index) {
setState(() {
  isSelected=index!;

});
            },
          ),
           Expanded(
             child: ListView.separated(itemBuilder: (context, index) {
             return RadioItem(radioName:isSelected==1 ?radioNames[index]:recitersNames[index],);
             },
                 separatorBuilder: (context, index) {
              return SizedBox(
               height: height*0.017,
             );
                 },
                 itemCount:isSelected==1 ? radioNames.length:recitersNames.length),
           )
        ],
      ),
    );
  }
}
