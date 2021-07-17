import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/models/data/selectWays_list.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class SelectWaysPage extends StatelessWidget {
  SelectWaysPage({Key? key}) : super(key: key);
  final double maxWidth = Get.width * 0.75; // show next card on the right
  final double iconSize = 24.0;

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
            padding: EdgeInsets.fromLTRB(AppMargins.edgeInsets,
                AppMargins.edgeInsets, 0, AppMargins.edgeInsets),
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
        padding: EdgeInsets.fromLTRB(0, 0, AppMargins.edgeInsets, 0),
        itemBuilder: (context, index) {
          return Card(
            //margin: EdgeInsets.symmetric(horizontal: AppMargins.edgeInsets / 2),
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
                        width: maxWidth - (iconSize * 4),
                        child: Divider(
                          indent: AppMargins.edgeInsets * 2,
                          endIndent: AppMargins.edgeInsets,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        fillColor: AppColors.primary,
                        child: Icon(
                          Icons.check,
                          color: AppColors.darkText,
                          size: iconSize,
                        ),
                        padding: EdgeInsets.all(AppMargins.edgeInsets),
                        shape: CircleBorder(),
                      )
                    ],
                  ),
                  SizedBox(height: AppMargins.edgeInsets / 2),
                  Flexible(child: generateListProfileTasks(cardIndex: index)),
                ],
              ),
            ),
          );
        });
  }

  Widget generateListProfileTasks({required int cardIndex}) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: itemList[cardIndex].listProfileTasks.length,
        padding: EdgeInsets.fromLTRB(0, 0, AppMargins.edgeInsets, 0),
        itemBuilder: (context, taskIndex) {
          return ListTile(
            dense: true,
            //visualDensity: VisualDensity.compact,
            leading: Text(
              "${taskIndex + 1}",
              style: TextStyle(color: AppColors.normalText),
            ),
            title: Text(
              "${itemList[cardIndex].listProfileTasks[taskIndex].name}",
              style: TextStyle(color: AppColors.normalText),
            ),
            subtitle: Text(
              "${itemList[cardIndex].listProfileTasks[taskIndex].link}",
              style: TextStyle(color: AppColors.backgroundText),
            ), // TODO: fix later - change link to some function showing reccurance
            //trailing: Text("codziennie"),
          );
        });
  }
}
