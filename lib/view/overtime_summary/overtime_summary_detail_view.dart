import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';

class OvertimeSummaryDetailView extends StatefulWidget {

  OvertimeSummaryDetailView({@required this.item});

  final OvertimeSummaryGridData item;

  @override
  _OvertimeSummaryDetailViewState createState() => _OvertimeSummaryDetailViewState();
}

class _OvertimeSummaryDetailViewState extends State<OvertimeSummaryDetailView> {
  var _overtimeSummaryCt = Get.find<OvertimeSummaryController>();

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.item.attachmentId != null) {
      _overtimeSummaryCt.getAttachment(widget.item.attachmentId);
    } else {
      _overtimeSummaryCt.setAttachmentData(FileAttachmentData());
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
                          children: [
                            Flexible(
                              child: Text('Overtime', style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                            ),
                            SizedBox(width: 4.w,),
                            SummaryDetailStatus(color: Color(0xFF1AB394), label: 'APPROVED'),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text('${widget.item.overtimeDate} ${widget.item.startHour} - ${widget.item.endHour}', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text('${widget.item.employeeName} / ${widget.item.jobTitle}', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        Text(widget.item.nip, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
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
                        children: [
                          _content('START', widget.item.startHour, false, false, () {}),
                          SizedBox(width: 10.w,),
                          _content('END', widget.item.endHour, false, false, () {})
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
                          _content('APPROVAL DATE', widget.item.approvalDate, false, false, () {}),
                          SizedBox(width: 10.w,),
                          _content(
                            'ATTACHMENT',
                            (_overtimeSummaryCt.attachmentData.value.fileName ?? '') == '' ? 'No attachment' : _overtimeSummaryCt.attachmentData.value.fileName,
                            (_overtimeSummaryCt.attachmentData.value.fileName ?? '') != '', _overtimeSummaryCt.loadingAttachment.value, () => CommonFunction().openAttachment(_overtimeSummaryCt.attachmentData.value.fileName, _overtimeSummaryCt.attachmentData.value.file),
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
