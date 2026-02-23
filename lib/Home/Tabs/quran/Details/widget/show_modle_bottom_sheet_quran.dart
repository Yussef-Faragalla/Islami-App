import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class ShowModleBottomSheetQuran extends StatelessWidget {
  final String selectedShape;
final Function(String) onShapeSelected;
  const ShowModleBottomSheetQuran({super.key,
    required this.selectedShape,
    required this.onShapeSelected});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.goldColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Settings",
              style: AppStyle.jannaBlack24bold.copyWith(fontSize: 40,),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: 2,
              color: AppColor.blackColor,
            ),

            SizedBox(height: height * 0.02),
            Text(
              "Favorite Shape",
              style: AppStyle.jannaBlack24bold.copyWith(fontSize: 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => onShapeSelected('shape1'),

                  child: Column(
                    children: [
                      Image.asset(AppAssets.quranShape2, fit: BoxFit.cover,),
                      Radio<String>(value: 'shape1',
                      groupValue: selectedShape,
                        onChanged: (val) => onShapeSelected(val!),
                      )
                    ],
                  ),
                ),
                SizedBox(width: width * 0.1),
                GestureDetector(
                 onTap: () =>
                    onShapeSelected('shape2'),

                  child: Column(
                    children: [
                      Image.asset(AppAssets.quranShape1, fit: BoxFit.cover,),
                    Radio<String>(value: 'shape2',
                    groupValue: selectedShape,
                      onChanged: (val) =>onShapeSelected(val!),) ,
                    ]
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
