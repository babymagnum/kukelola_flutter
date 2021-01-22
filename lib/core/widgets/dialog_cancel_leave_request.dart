import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_loading_bordered.dart';

class DialogCancelLeaveRequest extends StatelessWidget {

  DialogCancelLeaveRequest({@required this.action2Click});

  final Function action2Click;

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
                Text("Are you sure you want to cancel request? You can't undo this action.", textAlign: TextAlign.center, maxLines: 5, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, decoration: TextDecoration.none),),
                SizedBox(height: 24.h,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonLoadingBordered(
                        borderColor: Color(0xFFED5565),
                        disable: false,
                        title: 'No, Go back',
                        loading: false,
                        onTap: () => Get.back(),
                        borderRadius: 6,
                        verticalPadding: 12.h,
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFED5565), fontSizeDelta: 14.ssp),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: ButtonLoading(
                        backgroundColor: Color(0xFFED5565),
                        disable: false,
                        title: 'Yes, Cancel',
                        loading: false,
                        onTap: () {
                          action2Click();
                          Get.back();
                        },
                        borderRadius: 6,
                        verticalPadding: 12.h,
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
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
