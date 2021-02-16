import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/reimbursment_summary_detail/reimbursment_summary_detail_controller.dart';
import 'package:kukelola_flutter/view/reimbursment_summary_detail/widget/list_reimbursment_summary_detail_item.dart';

class ReimbursmentSummaryDetailView extends StatelessWidget {

  ReimbursmentSummaryDetailView({@required this.index, @required this.item});

  final ReimbursmentRequestForm item;
  final int index;

  var _reimbursmentSummaryDetailCt = Get.put(ReimbursmentSummaryDetailController());

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
                              child: Text('Reimbursment', style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                            ),
                            SizedBox(width: 4.w,),
                            SummaryDetailStatus(color: Color(0xFFC3C3C3), label: item.status),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text('11/01/2021 19:00', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text('Newt Salamander / Field Officer', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h,),
                      Row(
                        children: [
                          _content('DESCRIPTION', item.reason, false)
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      Row(
                        children: [
                          Expanded(
                            child: Text('ITEM DESCRIPTION', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                          ),
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: Text('ITEM COST', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Parent(style: ParentStyle()..height(1)..background.color(Color(0xFFC4C4C4))..width(Get.width),),
                      ListView.separated(
                        padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => ListReimbursmentSummaryDetailItem(item: item.listDetails[index]),
                        separatorBuilder: (_, __) => Divider(height: 16.h, color: Colors.transparent,),
                        itemCount: item.listDetails.length,
                      ),
                      Row(
                        children: [
                          _content('APPROVAL DATE', '-', false),
                          SizedBox(width: 10.w,),
                          _content('ATTACHMENT', item.attachment.path, true)
                        ],
                      ),
                      SizedBox(height: item.status == 'PENDING' ? 24.h : 0,),
                      item.status == 'PENDING' ?
                      Obx(() => ButtonLoading(
                          backgroundColor: ThemeColor.primary,
                          disable: _reimbursmentSummaryDetailCt.loadingCancel.value,
                          title: 'Cancel',
                          loading: _reimbursmentSummaryDetailCt.loadingCancel.value,
                          onTap: () => _reimbursmentSummaryDetailCt.cancelLeave(index),
                          verticalPadding: 14.h,
                          textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        ),
                      ) :
                      Container(),
                      SizedBox(height: 24.h,)
                    ],
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
