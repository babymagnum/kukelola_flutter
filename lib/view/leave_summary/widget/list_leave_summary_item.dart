import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';
import 'package:kukelola_flutter/core/widgets/dialog_cancel_leave_request.dart';
import 'package:kukelola_flutter/view/leave_summary_detail/leave_summary_detail_view.dart';

class ListLeaveSummaryItem extends StatelessWidget {

  ListLeaveSummaryItem({@required this.item, @required this.index});

  final LeaveRequestForm item;
  final int index;

  var _leaveSummaryCt = Get.put(LeaveSummaryController());

  Color _statusColor() {
    if (item.status == 'PENDING') return Color(0xFFC3C3C3);
    else if (item.status == 'APPROVED') return Color(0xFF1AB394);
    else if (item.status == 'CANCELLED') return Color(0xFF4D4D4D);
    else return Color(0xFF6D6D6D);
  }
  
  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() => Get.to(LeaveSummaryDetailView(item: item, index: index,))),
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.leaveType.label, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                    Text('${item.startDate} - ${item.endDate}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Text(item.status, style: ThemeTextStyle.biryaniExtraBold.apply(color: _statusColor(), fontSizeDelta: 12.ssp),)
            ],
          ),
          SizedBox(height: 24.h,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Newt Salamander', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                    Text('K00937', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                  ],
                ),
              ),
              SizedBox(width: item.status == 'PENDING' ? 10.w : 0,),
              item.status == 'PENDING' ?
              ButtonLoading(
                backgroundColor: Color(0xFFF85C58),
                disable: item.loading,
                title: 'Cancel',
                loading: item.loading,
                onTap: () => Get.dialog(DialogCancelLeaveRequest(action2Click: () => _leaveSummaryCt.cancelLeave(index))),
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                verticalPadding: 5.h,
                horizontalPadding: 17.w,
                borderRadius: 4,
                loadingSize: 10.w,
              ) :
              Container()    
            ],
          )
        ],
      ),
    );
  }
}
