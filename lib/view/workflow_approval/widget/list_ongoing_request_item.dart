import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/dialog_cancel_leave_request.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/dialog_reject_approval.dart';
import 'package:kukelola_flutter/view/workflow_approval_detail/ongoing_request_detail_view.dart';

class ListOngoingRequestItem extends StatelessWidget {

  ListOngoingRequestItem({@required this.item, @required this.index});

  final WorkflowGridData item;
  final int index;

  var _ongoingRequestCt = Get.find<OngoingRequestController>();

  Color _statusColor() {
    if (item.workflowStatus == 99) return Color(0xFFC3C3C3);
    else if (item.workflowStatus == 1) return Color(0xFF1AB394);
    else if (item.workflowStatus == 3) return Color(0xFF4D4D4D);
    else if (item.workflowStatus == 2) return Color(0xFFED5565);
    else return Colors.transparent;
  }

  String _status() {
    if (item.workflowStatus == 99) return 'PENDING';
    else if (item.workflowStatus == 1) return 'APPROVED';
    else if (item.workflowStatus == 3) return 'CANCELED';
    else if (item.workflowStatus == 2) return 'REJECTED';
    else return '-';
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      // gesture: Gestures()..onTap(() => Get.to(OngoingRequestDetailView(index: index, item: item))),
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                    Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                    SizedBox(height: 3.h,),
                    Row(
                      children: [
                        Text(item.createDate, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                        SizedBox(width: 20.w,),
                        Text(item.createTime, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Text(_status(), style: ThemeTextStyle.biryaniExtraBold.apply(color: _statusColor(), fontSizeDelta: 12.ssp),)
            ],
          ),
          SizedBox(height: 16.h,),
          Text(item.requestorName, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
          item.attachmentId != null ?
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: item.loadingAttachment ?
            SizedBox(
              width: 12.w, height: 12.w,
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
            ) :
            item.errorAttachment ?
            ButtonReload(onTap: () => _ongoingRequestCt.getAttachment(index)) :
            GestureDetector(
              onTap: () {
                if (item.attachmentData == null) {
                  _ongoingRequestCt.getAttachment(index);
                } else {
                  CommonFunction.openAttachment(item.attachmentData.fileName, item.attachmentData.file);
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: Icon(Icons.attachment, size: 14.w, color: item.isAttachment() ? Color(0xFF158AC9) : Color(0xFF6D6D6D),),
                  ),
                  SizedBox(width: 4.w,),
                  Expanded(child: Text(item.attachmentData != null ? item.attachmentData.fileName : 'load attachment', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 10.ssp, color: item.isAttachment() ? Color(0xFF158AC9) : Color(0xFF6D6D6D), decoration: TextDecoration.underline),))
                ],
              ),
            ),
          ) :
          Container(),
          SizedBox(height: 8.h),
          item.isMyRequest && item.workflowStatus == 99 ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonLoading(
                backgroundColor: Color(0xFFF85C58),
                disable: item.loadingCancel,
                title: 'Cancel',
                loading: item.loadingCancel,
                onTap: () => Get.dialog(DialogCancelLeaveRequest(color: Color(0xFFF85C58), action2Click: () => _ongoingRequestCt.cancelRequest(index))),
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                verticalPadding: 5.h,
                horizontalPadding: 17.w,
                borderRadius: 4,
                loadingSize: 10.w,
              ),
            ],
          ) :
          (item.levelProgress == 1 || item.levelProgress == 2) && item.approverId == homeController.userData.value.userId ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonLoading(
                backgroundColor: Color(0xFF158AC9),
                disable: item.loadingApprove,
                title: 'Approve',
                loading: item.loadingApprove,
                onTap: () => Get.dialog(DialogCancelLeaveRequest(color: Color(0xFF158AC9), description: "Are you sure you want to Approve the request? You can't undo this action.", action2Click: () => _ongoingRequestCt.approveRequest(index))),
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                verticalPadding: 5.h,
                horizontalPadding: 17.w,
                borderRadius: 4,
                loadingSize: 10.w,
              ),
              SizedBox(width: 8.h,),
              ButtonLoading(
                backgroundColor: Color(0xFFED5565),
                disable: item.loadingReject,
                title: 'Reject',
                loading: item.loadingReject,
                onTap: () => Get.dialog(DialogRejectApproval(index: index)),
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                verticalPadding: 5.h,
                horizontalPadding: 17.w,
                borderRadius: 4,
                loadingSize: 10.w,
              )
            ],
          ) :
          Container(),
        ],
      ),
    );
  }
}
