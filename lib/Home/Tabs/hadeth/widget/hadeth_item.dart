import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/modle/hadeth.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';

import '../../../../utils/app_style.dart';

class HadethItem extends StatefulWidget {
  final int index;

   HadethItem({super.key,required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;
@override
  void initState(){
    // TODO: implement initState
    super.initState();
    loadHadethFile(widget.index);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
      hadeth==null?
      Center(child: CircularProgressIndicator(),)
      :
      Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*0.008),
            child: Image.asset(AppAssets.hadethContentBg,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),

            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical:height*0.032,
                      horizontal: width*0.032),
                  child: Text(hadeth!.title ,
                    style: AppStyle.jannaBlack24bold,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: height*0.01,
                          horizontal: width*0.032
                          ),
                          child: Text(hadeth!.content ,
                          style: AppStyle.jannaBlack16bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void loadHadethFile(int index) async
  {
   String fileContact=await rootBundle.loadString("assets/hadeth/h$index.txt");
   int fileContactIndex=fileContact.indexOf('\n');
   String title=fileContact.substring(0,fileContactIndex);
   String content=fileContact.substring(fileContactIndex+1);
   hadeth=Hadeth(title: title, content: content);
   setState(() {

   });
  }
}
