import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/notification/notification_controller.dart';
import 'package:kukelola_flutter/view/notification/widget/list_notification_item.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> with AutomaticKeepAliveClientMixin<NotificationView> {

  var _notificationCt = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _notificationCt.getNotifikasi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: ButtonBack(label: 'Notification', onBack: () {}),
                ),
                SizedBox(width: 10.w,),
                AccountImage(url: 'asdobs', size: Size(28.w, 28.w), boxFit: BoxFit.fill)
              ],
            ),
          ),
          Expanded(
            child: _notificationCt.loadingNotifikasi.value?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 16.w, height: 16.w,
                )
              ],
            ) :
            _notificationCt.listNotifikasi.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmptyText(text: 'Empty notification', textSize: 16.ssp)
              ],
            ) :
            ListView.separated(
              itemCount: _notificationCt.listNotifikasi.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              itemBuilder: (_, index) => ListNotificationItem(
                item: _notificationCt.listNotifikasi[index],
                onClick: () => _notificationCt.notificationClick(index, _notificationCt.listNotifikasi[index]),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
            ),
          )
        ],
      ),
    );
  }

  @override bool get wantKeepAlive => true;
}
