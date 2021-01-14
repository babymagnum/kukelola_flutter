import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class DialogStandart extends StatelessWidget {

  DialogStandart({@required this.closeContent, @required this.content, @required this.actionTap, @required this.actionContent});

  final String content;
  final String closeContent;
  final Function actionTap;
  final String actionContent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 0,
      content: Parent(
        style: ParentStyle()..borderRadius(all: 8)..background.color(Colors.white)
          ..padding(vertical: 25.w, horizontal: 20.w)..maxHeight(Get.height - (Get.height * (0.05 * 2)))
          ..width(Get.width - ((Get.width * 0.2) * 2)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content, style: ThemeTextStyle.robotoRegular.apply(fontSizeDelta: 21.ssp),),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(closeContent, style: ThemeTextStyle.robotoBold.apply(color: ThemeColor.secondary, fontSizeDelta: 21.ssp),),
                  ),
                  SizedBox(width: 15.w,),
                  GestureDetector(
                    onTap: () {
                      actionTap();
                      Get.back();
                    },
                    child: Text(actionContent, style: ThemeTextStyle.robotoBold.apply(color: ThemeColor.secondary, fontSizeDelta: 21.ssp),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
