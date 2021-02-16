import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/attendance_request/attendance_request_view.dart';
import 'package:kukelola_flutter/view/business_trip/business_trip_view.dart';
import 'package:kukelola_flutter/view/calendar/calendar_view.dart';
import 'package:kukelola_flutter/view/dialog_payslip/dialog_payslip.dart';
import 'package:kukelola_flutter/view/dialog_payslip/dialog_payslip_controller.dart';
import 'package:kukelola_flutter/view/leave_request/leave_request_view.dart';
import 'package:kukelola_flutter/view/overtime_request/overtime_request_view.dart';
import 'package:kukelola_flutter/view/reimbursment_request/reimbursment_request_view.dart';
import 'package:kukelola_flutter/view/workflow_approval/workflow_approval_view.dart';

class ListHomeMenuItem extends StatelessWidget {
  ListHomeMenuItem({@required this.item, @required this.index});

  final HomeMenuItem item;
  final int index;

  var _dialogPayslipCt = Get.put(DialogPayslipController(), permanent: true);
  
  _onClick() {
    if (index == 0) {

    } else if (index == 1) {
      Get.to(AttendanceRequestView());
    } else if (index == 2) {
      Get.to(OvertimeRequestView());
    } else if (index == 3) {
      Get.to(LeaveRequestView());
    } else if (index == 4) {
      Get.to(BusinessTripView());
    } else if (index == 5) {
      Get.to(ReimbursmentRequestView());
    } else if (index == 6) {
      Get.dialog(DialogPayslip()).then((_) {
        if (_dialogPayslipCt.downloadSuccess.value) CommonFunction.standartSnackbar('payslip download successfully');
        _dialogPayslipCt.setDownloadSuccess(false);
      });
    } else if (index == 7) {
      Get.to(WorkflowApprovalView());
    } else {
      Get.to(CalendarView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(_onClick),
      style: ParentStyle()..background.color(Color(0xFFDEDEDE))..borderRadius(all: 12)
        ..padding(horizontal: 14.w)..ripple(true)..boxShadow(color: Colors.black.withOpacity(0.05), offset: Offset(0, 6), blur: 30, spread: 0),
      child: Column(
        children: [
          SizedBox(height: 12.h,),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Parent(
                  style: ParentStyle()..background.color(Color(0xFF158AC9))..width(48.w)..height(48.w)..borderRadius(all: 1000),
                  child: Center(
                    child: Image.asset(item.image, width: 28.w, height: 28.w, fit: BoxFit.contain,),
                  ),
                ),
              ),
              item.count == 0 ?
              Container() :
              Positioned(
                right: 0, top: 0,
                child: Parent(
                  style: ParentStyle()..background.color(Color(0xFFF85C58))..borderRadius(all: 1000)..padding(horizontal: 5, vertical: 1)
                    ..border(all: 2, color: Color(0xFFDEDEDE)),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Text('1', style: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 8.ssp),),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8.h,),
          Text('${item.label}\n', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp), maxLines: 2,),
          SizedBox(height: 12.h,)
        ],
      ),
    );
  }
}
