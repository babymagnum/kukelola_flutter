import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/profile/profile_controller.dart';
import 'package:kukelola_flutter/view/profile/widget/list_profile_menu_item.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with AutomaticKeepAliveClientMixin<ProfileView> {

  var _profileCt = Get.put(ProfileController());
  var _containerHomeCt = Get.find<ContainerHomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        SizedBox(height: context.mediaQueryPadding.top + 24.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ButtonBack(label: 'Profile', onBack: () => _containerHomeCt.pageController.jumpToPage(0)),
        ),
        Expanded(
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 14.h,),
                  AccountImage(url: 'aksdjobs', size: Size(64.w, 64.w), boxFit: BoxFit.fill),
                  SizedBox(height: 14.h,),
                  Text('Newt Salamander', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 20.ssp),),
                  SizedBox(height: 2.h,),
                  Text('hello'.tr, style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 12.ssp),),
                  SizedBox(height: 2.h,),
                  Text('PT. App KuKulola ID', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 11.ssp),),
                  SizedBox(height: 18.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('NIP', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                          SizedBox(height: 5.h,),
                          Text('K000391', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
                          SizedBox(height: 12.h,),
                          Text('OPTIONS', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                          ListView.separated(
                            padding: EdgeInsets.only(top: 16.h, bottom: 24.w),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => ListProfileMenuItem(
                              item: _profileCt.listProfileMenu[index], index: index, context: context,
                            ),
                            separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 20.h,),
                            itemCount: _profileCt.listProfileMenu.length,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
    );
  }

  @override bool get wantKeepAlive => true;
}
