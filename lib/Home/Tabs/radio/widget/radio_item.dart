import 'package:flutter/cupertino.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class RadioItem extends StatefulWidget {
  final String radioName;
  const RadioItem({super.key,required this.radioName});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlayed=false;
  bool isMute=true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.90,
height: height*0.14,
decoration: BoxDecoration(
  color: AppColor.goldColor,
borderRadius: BorderRadius.circular(20),
),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*0.0107296137339056),
            child: Text(widget.radioName,style: AppStyle.jannaBlack20bold,),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
              !isPlayed?  Image.asset(AppAssets.radioMosqo,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ):                SizedBox(
    width: double.infinity,
    height: double.infinity,

    child: Image.asset(AppAssets.sound,
    fit: BoxFit.cover,
    ),
    ),

    Padding(
  padding:  EdgeInsets.only(bottom:height*0.0085836909871245),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: width*0.0465116279069767,
    children: [
      Padding(
        padding:  EdgeInsets.only(left:width*0.127906976744186, ),
        child: GestureDetector(
            onTap:
            () {
              setState(() {
                isPlayed = !isPlayed;
              });
            },

            child:isPlayed? Image.asset(AppAssets.pause):Image.asset(AppAssets.play)),),

      GestureDetector(
          onTap: () {
            setState(() {
              isMute= !isMute;
            });
          },
          child: isMute?Image.asset(AppAssets.soundOn): Image.asset(AppAssets.soundOff)),
    ],
  ),
  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
