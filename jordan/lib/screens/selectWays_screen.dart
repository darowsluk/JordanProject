import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/data/selectWays_list.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class SelectWaysPage extends StatelessWidget {
  SelectWaysPage({Key? key}) : super(key: key);
  final double maxWidth = 400;

  final itemList = generateSelectWayItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        //title: Text(TrStrings.trPlanTitle.tr),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.symmetric(vertical: AppMargins.edgeInsets),
            color: AppColors.background,
            child: generateSelectWaysItemsList(),
          ),
        ),
      ),
    );
  }

  Widget generateSelectWaysItemsList() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        padding: EdgeInsets.symmetric(horizontal: AppMargins.edgeInsets),
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: AppMargins.edgeInsets / 2),
            child: SizedBox(
              width: maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: AppMargins.edgeInsets * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: AppMargins.edgeInsets * 2),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppMargins.cornerRadius),
                        child: Image.asset(
                          itemList[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: AppMargins.edgeInsets),
                      SizedBox(
                        width: maxWidth - 100 - (AppMargins.edgeInsets * 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              itemList[index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: AppTextStyle.defaultTextSize),
                            ),
                            SizedBox(height: AppMargins.separation),
                            Text(
                              itemList[index].subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: AppColors.normalText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppMargins.edgeInsets / 2),
                  Row(
                    children: [
                      SizedBox(
                        width: 300, // TODO: calculate
                        child: Divider(
                          indent: AppMargins.edgeInsets * 2,
                          endIndent: AppMargins.edgeInsets,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: AppColors.primary,
                        child: Icon(
                          Icons.check,
                          color: AppColors.darkText,
                          size: 20.0,
                        ),
                        padding: EdgeInsets.all(AppMargins.edgeInsets),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
