import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/widget/list_overtime_summary_item.dart';

class OvertimeSummaryView extends StatelessWidget {

  var _overtimeSummaryCt = Get.put(OvertimeSummaryController());

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
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
                    label: 'Leave Summary',
                    onBack: () => Get.back(),
                  ),
                ),
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
              _overtimeSummaryCt.listSummary.length == 0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyText(text: 'Empty leave summary', textSize: 16.ssp)
                ],
              ) :
              ListView.separated(
                itemCount: _overtimeSummaryCt.listSummary.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemBuilder: (_, index) => ListOvertimeSummaryItem(item: _overtimeSummaryCt.listSummary[index], index: index,),
                separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
              )
            ),
          )
        ],
      ),
    );
  }
}
