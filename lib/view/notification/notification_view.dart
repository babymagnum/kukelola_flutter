import 'dart:convert';

import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/notification/notification_controller.dart';
import 'package:kukelola_flutter/view/notification/widget/list_notification_item.dart';

import '../../main.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> with AutomaticKeepAliveClientMixin<NotificationView> {

  var _notificationCt = Get.put(NotificationController());
  var _containerHomeCt = Get.find<ContainerHomeController>();
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _notificationCt.getNotifikasi(true);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!_notificationCt.loadingNotifikasi.value) _notificationCt.getNotifikasi(false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
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
                  child: ButtonBack(label: 'Notification', onBack: () {
                    _containerHomeCt.pageController.jumpToPage(0);
                    _containerHomeCt.setSelectedPage(0);
                  }),
                ),
                SizedBox(width: 10.w,),
                AccountImage(
                  url: homeController.profilePicture.value,
                  size: Size(28.w, 28.w),
                  onError: () => homeController.getProfilePicture(),
                  error: homeController.errorProfilePicture.value,
                  boxFit: BoxFit.contain,
                  loading: homeController.loadingProfilePicture.value,
                  loadingSize: Size(8.w, 8.w),
                )
              ],
            ),
          ),
          Expanded(
            child: _notificationCt.loadingNotifikasi.value && _notificationCt.listNotifikasi.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                  ),
                  width: 16.w, height: 16.w,
                )
              ],
            ) :
            _notificationCt.errorNotifikasi.value && _notificationCt.listNotifikasi.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ButtonReload(onTap: () => _notificationCt.getNotifikasi(true)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ) :
            _notificationCt.listNotifikasi.length == 0 ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmptyText(text: 'Empty notification', textSize: 16.ssp)
              ],
            ) :
            CupertinoScrollbar(
              child: ListView.separated(
                controller: _scrollController,
                itemCount:  _notificationCt.loadingNotifikasi.value || _notificationCt.errorNotifikasi.value ? _notificationCt.listNotifikasi.length + 1 : _notificationCt.listNotifikasi.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                itemBuilder: (_, index) {
                  if (index == _notificationCt.listNotifikasi.length) {
                    if (_notificationCt.loadingNotifikasi.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: SizedBox(
                              height: 16.w, width: 16.w,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (_notificationCt.errorNotifikasi.value) {
                      return ButtonReload(onTap: () => _notificationCt.getNotifikasi(false));
                    } else {
                      return Container();
                    }
                  } else {
                    return ListNotificationItem(item: _notificationCt.listNotifikasi[index], onClick: () {});
                  }
                },
                separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override bool get wantKeepAlive => true;
}
