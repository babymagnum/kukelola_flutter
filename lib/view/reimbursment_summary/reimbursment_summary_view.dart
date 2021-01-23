import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/overtime_summary/overtime_summary_controller.dart';
import 'package:kukelola_flutter/view/overtime_summary/widget/list_overtime_summary_item.dart';
import 'package:kukelola_flutter/view/reimbursment_summary/reimbursment_summary_controller.dart';
import 'package:kukelola_flutter/view/reimbursment_summary/widget/list_reimbursment_summary_item.dart';

class ReimbursmentSummaryView extends StatelessWidget {

  var _reimbursmentSummaryCt = Get.put(ReimbursmentSummaryController());

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      _reimbursmentSummaryCt.populateData();
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
                    label: 'Reimbursment Summary',
                    onBack: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => _reimbursmentSummaryCt.loadingSummary.value?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                    width: 16.w, height: 16.w,
                  )
                ],
              ) :
              _reimbursmentSummaryCt.listSummary.length == 0 ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyText(text: 'Empty reimbursment summary', textSize: 16.ssp)
                ],
              ) :
              ListView.separated(
                itemCount: _reimbursmentSummaryCt.listSummary.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemBuilder: (_, index) => ListReimbursmentSummaryItem(item: _reimbursmentSummaryCt.listSummary[index], index: index,),
                separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
              )
            ),
          )
        ],
      ),
    );
  }
}
