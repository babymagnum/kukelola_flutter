import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/completed_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval_detail/completed_request_detail_view.dart';

class ListCompletedRequestItem extends StatelessWidget {

  final WorkflowGridData item;
  final int index;

  ListCompletedRequestItem({@required this.item, @required this.index});

  var _completedRequestCt = Get.find<CompletedRequestController>();

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
      // gesture: Gestures()..onTap(() => Get.to(CompletedRequestDetailView(item: item))),
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
                    item.workflowStatus == 2 ?
                    // Text('Reason: ${item.rejectReason}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),) :
                    RichText(
                      text: TextSpan(
                        text: 'Reason: ',
                        style: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.black.withOpacity(0.9), fontSizeDelta: 10.ssp),
                        children: [
                          TextSpan(
                            text: (item.rejectReason ?? '') == '' ? 'Tidak ditemukan alasan' : item.rejectReason,
                            style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),
                          )
                        ]
                      ),
                    ) :
                    Container(),
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
          SizedBox(height: 24.h,),
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
            ButtonReload(onTap: () => _completedRequestCt.getAttachment(index)) :
            GestureDetector(
              onTap: () {
                if (item.attachmentData == null) {
                  _completedRequestCt.getAttachment(index);
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
        ],
      ),
    );
  }
}
