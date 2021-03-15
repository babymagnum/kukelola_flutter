import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/workflow_approval_detail/workflow_approval_detail_controller.dart';

class CompletedRequestDetailView extends StatefulWidget {
  CompletedRequestDetailView({@required this.item});

  final WorkflowGridData item;

  @override
  _CompletedRequestDetailViewState createState() => _CompletedRequestDetailViewState();
}

class _CompletedRequestDetailViewState extends State<CompletedRequestDetailView> {
  bool _isSpecialLeave() => false;
  var _workflowApprovalDetailCt = Get.put(WorkflowApprovalDetailController());

  Widget _content(String title, String content, bool isAttachment, bool loading, Function onTap) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
          loading ?
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              width: 12.w, height: 12.w,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
              ),
            ),
          ) :
          GestureDetector(
            onTap: onTap,
            child: Text(content, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: isAttachment ? Color(0xFF158AC9) : Color(0xFF181921), decoration: isAttachment ? TextDecoration.underline : null),),
          ),
        ],
      ),
    );
  }

  Color _statusColor() {
    if (widget.item.workflowStatus == 99) return Color(0xFFC3C3C3);
    else if (widget.item.workflowStatus == 1) return Color(0xFF1AB394);
    else if (widget.item.workflowStatus == 3) return Color(0xFF4D4D4D);
    else if (widget.item.workflowStatus == 2) return Color(0xFFED5565);
    else return Colors.transparent;
  }

  String _status() {
    if (widget.item.workflowStatus == 99) return 'PENDING';
    else if (widget.item.workflowStatus == 1) return 'APPROVED';
    else if (widget.item.workflowStatus == 3) return 'CANCELED';
    else if (widget.item.workflowStatus == 2) return 'REJECTED';
    else return '-';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.item.attachmentId != null) {
      _workflowApprovalDetailCt.getAttachment(widget.item.attachmentId);
    } else {
      _workflowApprovalDetailCt.setAttachmentData(FileAttachmentData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Parent(
            style: ParentStyle()..background.color(Color(0xFFF8AC58)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.mediaQueryPadding.top + 24.h,),
                        ButtonBack(label: '', onBack: () => Get.back()),
                        SizedBox(height: 40.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(widget.item.name, style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                            ),
                            SizedBox(width: 4.w,),
                            _status() == '' ?
                            Container() :
                            Padding(
                              padding: EdgeInsets.only(top: 4.h),
                              child: SummaryDetailStatus(color: _statusColor(), label: _status()),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text(widget.item.createDate, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text(widget.item.requestorName, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        Text('K0090192', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 24.h,)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 15.h, bottom: 24.h),
                  child: SvgPicture.asset('assets/images/summary_detail_flower.svg', width: Get.width * 0.2, height: Get.height * 0.25,),
                )
              ],
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _content(_isSpecialLeave() ? 'SPECIAL LEAVE' : 'LEAVE TYPE', '-', false, false, () {}),
                            SizedBox(width: 10.w,),
                            _content('TOTAL DAYS', '-', false, false, () {})
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _content('DESCRIPTION', widget.item.description, false, false, () {})
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _content('APPROVAL DATE', '-', false, false, () {}),
                            SizedBox(width: 10.w,),
                            _content(
                              'ATTACHMENT',
                              (_workflowApprovalDetailCt.attachmentData.value.fileName ?? '') == '' ? 'No attachment' : _workflowApprovalDetailCt.attachmentData.value.fileName,
                              (_workflowApprovalDetailCt.attachmentData.value.fileName ?? '') != '', _workflowApprovalDetailCt.loadingAttachment.value, () => _workflowApprovalDetailCt.openAttachment(),
                            )
                          ],
                        ),
                        SizedBox(height: 24.h,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
