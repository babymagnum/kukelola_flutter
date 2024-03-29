import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_loading_bordered.dart';

class DialogCancelLeaveRequest extends StatelessWidget {

  DialogCancelLeaveRequest({this.color = const Color(0xFFED5565), @required this.action2Click, this.action2Content = 'Yes', this.description = "Are you sure you want to Cancel the request? You can't undo this action."});

  final Function action2Click;
  final String description;
  final String action2Content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Parent(
          style: ParentStyle()..margin(horizontal: 24.w)..borderRadius(all: 16)..background.color(Colors.white)..padding(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(description, textAlign: TextAlign.center, maxLines: 5, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, decoration: TextDecoration.none),),
                SizedBox(height: 24.h,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonLoadingBordered(
                        borderColor: color,
                        disable: false,
                        title: 'No',
                        loading: false,
                        onTap: () => Get.back(),
                        borderRadius: 6,
                        verticalPadding: 6.h,
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: color, fontSizeDelta: 12.ssp),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: ButtonLoading(
                        backgroundColor: color,
                        disable: false,
                        title: action2Content,
                        loading: false,
                        onTap: () {
                          action2Click();
                          Get.back();
                        },
                        borderRadius: 6,
                        verticalPadding: 6.h,
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
