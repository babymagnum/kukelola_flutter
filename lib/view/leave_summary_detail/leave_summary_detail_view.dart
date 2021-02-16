import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/leave_summary_detail/leave_summary_detail_controller.dart';

class LeaveSummaryDetailView extends StatelessWidget {

  LeaveSummaryDetailView({@required this.index, @required this.item});

  final LeaveRequestForm item;
  final int index;

  var _leaveSummaryDetailCt = Get.put(LeaveSummaryDetailController());

  bool _isSpecialLeave() => item.leaveType.label == 'Special Leave';

  Widget _content(String title, String content, bool isAttachment) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
          Text(content, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp, color: isAttachment ? Color(0xFF158AC9) : Color(0xFF181921), decoration: isAttachment ? TextDecoration.underline : null),),
        ],
      ),
    );
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
                              child: Text(item.leaveType.label, style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                            ),
                            SizedBox(width: 4.w,),
                            SummaryDetailStatus(color: Color(0xFFC3C3C3), label: item.status),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text('${item.startDate} - ${item.endDate}', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text('Newt Salamander', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
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
                          children: [
                            _content(_isSpecialLeave() ? 'SPECIAL LEAVE' : 'LEAVE TYPE', _isSpecialLeave() ? item.specialLeaveType.label : item.leaveType.label, false),
                            SizedBox(width: 10.w,),
                            _content('TOTAL DAYS', '${TextUtil.differenceDate(item.endDate, item.startDate, 'dd/MM/yyyy')}', false)
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          children: [
                            _content('DESCRIPTION', item.reason, false)
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          children: [
                            _content('APPROVAL DATE', '-', false),
                            SizedBox(width: 10.w,),
                            _content('ATTACHMENT', item.attachment.path, true)
                          ],
                        ),
                        SizedBox(height: item.status == 'PENDING' ? 24.h : 0,),
                        item.status == 'PENDING' ?
                        ButtonLoading(
                          backgroundColor: ThemeColor.primary,
                          disable: _leaveSummaryDetailCt.loadingCancel.value,
                          title: 'Cancel',
                          loading: _leaveSummaryDetailCt.loadingCancel.value,
                          onTap: () => _leaveSummaryDetailCt.cancelLeave(index),
                          verticalPadding: 14.h,
                          textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        ) :
                        Container(),
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
