import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/view/overtime_summary_filter.dart';
import 'package:kukelola_flutter/view/overtime_summary/view/overtime_summary_filter_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/widget/list_overtime_summary_item.dart';

class OvertimeSummaryView extends StatelessWidget {

  var _overtimeSummaryCt = Get.put(OvertimeSummaryController());

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      Get.put(OvertimeSummaryFilterController());
      _overtimeSummaryCt.populateData();
    });

    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: ButtonBack(
                    label: 'Overtime Summary',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(height: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: false,
                  title: 'Filter',
                  loading: false,
                  onTap: () => Get.bottomSheet(OvertimeSummaryFilter()),
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                  image: 'assets/images/ic_filter.svg',
                  verticalPadding: 5.h,
                  imageSize: Size(10.w, 12.h),
                  imageMargin: 4.w,
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() => _overtimeSummaryCt.loadingSummary.value?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                    width: 16.w, height: 16.w,
                  )
                ],
              ) :
              _overtimeSummaryCt.errorSummary.value ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ButtonReload(onTap: () => _overtimeSummaryCt.populateData()),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              ) :
              _overtimeSummaryCt.listSummary.length == 0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyText(text: 'Empty overtime summary')
                ],
              ) :
              ListView.separated(
                itemCount: _overtimeSummaryCt.listSummary.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemBuilder: (_, index) => ListOvertimeSummaryItem(item: _overtimeSummaryCt.listSummary[index]),
                separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
              )
            ),
          )
        ],
      ),
    );
  }
}
