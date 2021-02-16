import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/completed_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/list_completed_request_item.dart';

class CompletedRequestTab extends StatefulWidget {
  @override
  _CompletedRequestTabState createState() => _CompletedRequestTabState();
}

class _CompletedRequestTabState extends State<CompletedRequestTab> with AutomaticKeepAliveClientMixin {

  var _completedRequestCt = Get.put(CompletedRequestController());

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => _completedRequestCt.getOngoingRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _completedRequestCt.loading.value ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w, height: 20.w,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
            ),
          )
        ],
      ) :
      _completedRequestCt.listCompletedRequest.length == 0 ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyText(text: 'Tidak ada ongoing request', textSize: 12.ssp),
        ],
      ) :
      ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        itemBuilder: (_, index) => ListCompletedRequestItem(item: _completedRequestCt.listCompletedRequest[index], index: index),
        separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 16.h,),
        itemCount: _completedRequestCt.listCompletedRequest.length,
      )
    );
  }

  @override bool get wantKeepAlive => true;
}
