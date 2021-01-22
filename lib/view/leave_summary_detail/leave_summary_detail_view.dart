import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/view/base_view.dart';

class LeaveSummaryDetailView extends StatelessWidget {

  LeaveSummaryDetailView({@required this.item});

  final LeaveRequestForm item;

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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 15.h, bottom: 15.h),
                  child: SvgPicture.asset('assets/images/summary_detail_flower.svg', width: Get.width * 0.2, height: Get.height * 0.25,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
