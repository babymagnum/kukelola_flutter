import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/networking/model/reimbursment_summary_grid.dart';
import 'package:kukelola_flutter/view/base_view.dart';

class ReimbursmentSummaryDetailView extends StatelessWidget {

  ReimbursmentSummaryDetailView({@required this.item});

  final ReimbursmentSummaryGridData item;

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
                            SummaryDetailStatus(color: Color(0xFF1AB394), label: 'APPROVED'),
                          ],
                        ),
                        SizedBox(height: 4.h,),
                        Text('11/01/2021 19:00', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text('${item.name} / ${item.jobTitle}', style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        Text(item.nip, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
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
                          _content('DESCRIPTION', item.description, false)
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Text('ITEM DESCRIPTION', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                      //     ),
                      //     SizedBox(width: 10.w,),
                      //     Expanded(
                      //       child: Text('ITEM COST', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(height: 8.h,),
                      // Parent(style: ParentStyle()..height(1)..background.color(Color(0xFFC4C4C4))..width(Get.width),),
                      // ListView.separated(
                      //   padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemBuilder: (_, index) => ListReimbursmentSummaryDetailItem(item: item.listDetails[index]),
                      //   separatorBuilder: (_, __) => Divider(height: 16.h, color: Colors.transparent,),
                      //   itemCount: item.listDetails.length,
                      // ),
                      Row(
                        children: [
                          _content('APPROVAL DATE', item.approvalDate, false),
                          SizedBox(width: 10.w,),
                          _content('ATTACHMENT', '-', true)
                        ],
                      ),
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
