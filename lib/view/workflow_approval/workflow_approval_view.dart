import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/completed_request_tab.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/ongoing_request_tab.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/workflow_approval_filter.dart';

import 'controller/completed_request_controller.dart';

class WorkflowApprovalView extends StatefulWidget {
  @override
  _WorkflowApprovalViewState createState() => _WorkflowApprovalViewState();
}

class _WorkflowApprovalViewState extends State<WorkflowApprovalView> with SingleTickerProviderStateMixin {

  TabController _tabController;
  var _workflowApprovalCt = Get.put(WorkflowApprovalController());

  @override
  void initState() {
    //init controller here
    Get.put(CompletedRequestController());
    Get.put(OngoingRequestController());
    Get.put(WorkflowApprovalFilterController());

    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => _workflowApprovalCt.setCurrentPage(_tabController.index));
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    label: 'Workflow Approval',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(height: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: false,
                  title: 'Filter',
                  loading: false,
                  onTap: () => Get.bottomSheet(WorkflowApprovalFilter(), isScrollControlled: true),
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                  image: 'assets/images/ic_filter.svg',
                  verticalPadding: 5.h,
                  imageSize: Size(10.w, 12.h),
                  imageMargin: 4.w,
                )
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => TabBar(
                controller: _tabController,
                indicatorColor: ThemeColor.primary,
                indicatorWeight: 4.h,
                tabs: [
                  Text('Ongoing Request', style: (_workflowApprovalCt.currentPage.value == 0 ? ThemeTextStyle.biryaniBold : ThemeTextStyle.biryaniRegular).apply(color: _workflowApprovalCt.currentPage.value == 0 ? ThemeColor.primary : Color(0xFFB6B6B9), fontSizeDelta: 12.ssp),),
                  Text('Completed Request', style: (_workflowApprovalCt.currentPage.value == 1 ? ThemeTextStyle.biryaniBold : ThemeTextStyle.biryaniRegular).apply(color: _workflowApprovalCt.currentPage.value == 1 ? ThemeColor.primary : Color(0xFFB6B6B9), fontSizeDelta: 12.ssp),),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                OngoingRequestTab(),
                CompletedRequestTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
