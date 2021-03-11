import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/networking/model/notification.dart';

class ListNotificationItem extends StatelessWidget {

  ListNotificationItem({@required this.item, @required this.onClick});

  final NotificationData item;
  final Function onClick;

  bool unread() {
    return false;
  }

  String image() {
    if (item.workflowType == 1) {
      return 'assets/images/leave_request 1.png';
    } else if (item.workflowType == 2) {
      return 'assets/images/attendance_request 1.png';
    } else if (item.workflowType == 3) {
      return 'assets/images/overtime_request 1.png';
    } else if (item.workflowType == 4) {
      return 'assets/images/reimbursement 1.png';
    } else if (item.workflowType == 5) {
      return 'assets/images/business_trip 2.png';
    } else {
      return 'assets/images/attendance_request 1.png';
    }
  }

  String _description() {
    if (item.workflowStatus == 99) return 'Your ${item.workflowTypeName.toLowerCase()} request is pending by manager';
    else if (item.workflowStatus == 1) return 'Your ${item.workflowTypeName.toLowerCase()} request is approved by manager';
    else if (item.workflowStatus == 3) return 'Your ${item.workflowTypeName.toLowerCase()} request is canceled by manager';
    else if (item.workflowStatus == 2) return 'Your ${item.workflowTypeName.toLowerCase()} request is rejected by manager';
    else return '-';
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(onClick),
      style: ParentStyle()..background.color(unread() ? Color(0xFFE9EAEA) : Color(0xFFE9EAEA))
        ..borderRadius(all: 8)..ripple(true)..padding(horizontal: 12.w, vertical: 16.h),
      child: Row(
        children: [
          Parent(
            style: ParentStyle()..background.color(Color(0xFF158AC9))..width(48.w)..height(48.w)..borderRadius(all: 1000),
            child: Center(
              child: Image.asset(image(), width: 28.w, height: 28.w, fit: BoxFit.contain,),
            ),
          ),
          SizedBox(width: 14.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(TextUtil.convertDateStringToAnotherFormat(item.workflowDate, 'dd/MM/yyyy HH:mm', "yyyy-MM-dd'T'HH:mm:ss"), style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 8.ssp),),
                    ),
                    SizedBox(width: unread() ? 10.w : 0),
                    unread() ?
                    Text('NEW!', style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 8.ssp),) :
                    Container(),
                  ],
                ),
                Text(item.workflowTypeName, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 14.ssp),),
                Text(_description(), style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
