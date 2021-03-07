import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/dialog_cancel_leave_request.dart';
import 'package:kukelola_flutter/core/widgets/summary_detail_status.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/dialog_reject_approval.dart';

class OngoingRequestDetailView extends StatelessWidget {

  OngoingRequestDetailView({@required this.index, @required this.item});

  final WorkflowGridData item;
  final int index;

  var _ongoingRequestCt = Get.find<OngoingRequestController>();

  // bool _isSpecialLeave() => item.leaveType == 'Special Leave';
  bool _isSpecialLeave() => false;

  Color _statusColor() {
    if (item.workflowStatus == 99) return Color(0xFFC3C3C3);
    else if (item.workflowStatus == 1) return Color(0xFF1AB394);
    else if (item.workflowStatus == 3) return Color(0xFF4D4D4D);
    else if (item.workflowStatus == 2) return Color(0xFFED5565);
    else return Colors.transparent;
  }

  String _status() {
    if (item.workflowStatus == 99) return 'PENDING';
    else if (item.workflowStatus == 1) return 'APPROVED';
    else if (item.workflowStatus == 3) return 'CANCELED';
    else if (item.workflowStatus == 2) return 'REJECTED';
    else return '-';
  }

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
                        Obx(() => Row(
                            children: [
                              Flexible(
                                child: Text(item.name, style: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 18.ssp),),
                              ),
                              SizedBox(width: 4.w,),
                              _status() == '' ?
                              Container() :
                              SummaryDetailStatus(color: _statusColor(), label: _status()),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Text(item.createDate, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
                        SizedBox(height: 16.h,),
                        Text(item.requestorName, style: ThemeTextStyle.biryaniRegular.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
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
                          _content(_isSpecialLeave() ? 'SPECIAL LEAVE' : 'LEAVE TYPE', '-', false),
                          SizedBox(width: 10.w,),
                          _content('TOTAL DAYS', '-', false)
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      Row(
                        children: [
                          _content('DESCRIPTION', item.description, false)
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      Row(
                        children: [
                          _content('APPROVAL DATE', '-', false),
                          SizedBox(width: 10.w,),
                          _content('ATTACHMENT', '-', true)
                        ],
                      ),
                      SizedBox(height: _status() == '' ? 24.h : 0,),
                      _status() != '' ?
                      Container() :
                      !item.isMyRequest ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ButtonLoading(
                              backgroundColor: Color(0xFF158AC9),
                              disable: _ongoingRequestCt.listOngoingRequest[index].loadingApprove,
                              title: 'Approve',
                              loading: _ongoingRequestCt.listOngoingRequest[index].loadingApprove,
                              onTap: () => Get.dialog(DialogCancelLeaveRequest(action2Click: () => _ongoingRequestCt.approveRequest(index), description: "Are you sure want to approve this request? This process can't be undo.",)),
                              textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                              verticalPadding: 10.h,
                              horizontalPadding: 17.w,
                              borderRadius: 4,
                              loadingSize: 10.w,
                            ),
                          ),
                          SizedBox(width: 8.h,),
                          Expanded(
                            child: ButtonLoading(
                              backgroundColor: Color(0xFFED5565),
                              disable: _ongoingRequestCt.listOngoingRequest[index].loadingReject,
                              title: 'Reject',
                              loading: _ongoingRequestCt.listOngoingRequest[index].loadingReject,
                              onTap: () => Get.dialog(DialogRejectApproval(index: index)),
                              textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                              verticalPadding: 10.h,
                              horizontalPadding: 17.w,
                              borderRadius: 4,
                              loadingSize: 10.w,
                            ),
                          )
                        ],
                      ) :
                      ButtonLoading(
                        backgroundColor: Color(0xFFF85C58),
                        disable: _ongoingRequestCt.listOngoingRequest[index].loadingCancel,
                        title: 'Cancel',
                        loading: _ongoingRequestCt.listOngoingRequest[index].loadingCancel,
                        onTap: () => Get.dialog(DialogCancelLeaveRequest(action2Click: () => _ongoingRequestCt.cancelRequest(index))),
                        textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        verticalPadding: 10.h,
                        horizontalPadding: 17.w,
                        borderRadius: 4,
                        loadingSize: 10.w,
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
