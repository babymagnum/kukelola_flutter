import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/workflow_approval_filter_controller.dart';
import 'package:kukelola_flutter/view/workflow_approval/widget/list_ongoing_request_item.dart';

class OngoingRequestTab extends StatefulWidget {
  @override
  _OngoingRequestTabState createState() => _OngoingRequestTabState();
}

class _OngoingRequestTabState extends State<OngoingRequestTab> with AutomaticKeepAliveClientMixin {

  var _ongoingRequestCt = Get.find<OngoingRequestController>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => _ongoingRequestCt.getOngoingRequest());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _ongoingRequestCt.loadingRequest.value ?
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
      _ongoingRequestCt.errorRequest.value ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonReload(onTap: () => _ongoingRequestCt.getOngoingRequest()),
            ],
          )
        ],
      ) :
      _ongoingRequestCt.listOngoingRequest.length == 0 ?
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyText(text: 'Tidak ada ongoing request'),
        ],
      ) :
      CupertinoScrollbar(
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          itemBuilder: (_, index) => ListOngoingRequestItem(item: _ongoingRequestCt.listOngoingRequest[index], index: index),
          separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 16.h,),
          itemCount: _ongoingRequestCt.listOngoingRequest.length,
        ),
      )
    );
  }

  @override bool get wantKeepAlive => true;
}
