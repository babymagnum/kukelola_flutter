import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/view/workflow_approval_detail/completed_request_detail_view.dart';

class ListCompletedRequestItem extends StatelessWidget {

  ListCompletedRequestItem({@required this.item, @required this.index});

  final WorkflowGridData item;
  final int index;

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

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() => Get.to(CompletedRequestDetailView(item: item))),
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16.w, vertical: 16.h),
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
                    Text(item.name, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                    Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                    SizedBox(height: 3.h,),
                    Row(
                      children: [
                        Text(item.createDate, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                        SizedBox(width: 20.w,),
                        Text(item.createTime, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Text(_status(), style: ThemeTextStyle.biryaniExtraBold.apply(color: _statusColor(), fontSizeDelta: 12.ssp),)
            ],
          ),
          SizedBox(height: 24.h,),
          Text(item.requestorName, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
        ],
      ),
    );
  }
}
