import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/home/widget/list_home_menu_item.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with AutomaticKeepAliveClientMixin<HomeView>  {

  @override
  void initState() {
    super.initState();

    homeController.getUser();
    homeController.getTotalWorkflow();
    homeController.populateMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeController.loadingUser.value ?
      Center(
        child: SizedBox(
          width: 20.w, height: 20.w,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
        ),
      ) :
      homeController.errorUser.value ?
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonReload(onTap: () => homeController.getUser()),
          ],
        )
      ) :
      Stack(
        children: [
          Container(
            width: Get.width, height: Get.height,
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  width: Get.width, height: Get.height, color: Color(0xFFF8AC58),
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width, height: Get.height, color: Color(0xFFF9F7F7),
                ),
              ),
            ],
          ),
          Positioned(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.mediaQueryPadding.top + 35.h,),
                      Align(
                        alignment: Alignment.center,
                        child: AccountImage(
                          url: homeController.profilePicture.value,
                          size: Size(64.w, 64.w),
                          errorSize: 32.w,
                          imageNull: homeController.userData.value.profilePictureId == null,
                          onError: () => homeController.getProfilePicture(),
                          error: homeController.errorProfilePicture.value,
                          boxFit: BoxFit.contain,
                          loading: homeController.loadingProfilePicture.value,
                          loadingSize: Size(16.w, 16.w),
                          loadingColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 14.h,),
                      Text(homeController.userData?.value?.fullName ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 20.ssp, color: Color(0xFF404040)),),
                      SizedBox(height: 2.h,),
                      Text(homeController.userData?.value?.jobTitle ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
                      SizedBox(height: 2.h,),
                      Text(homeController.userData?.value?.clientName ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 11.ssp, color: Color(0xFF404040)),),
                      SizedBox(height: 18.h,),
                      Parent(
                        style: ParentStyle()..background.color(Color(0xFFF1F1F1))..borderRadius(all: 16)..width(Get.width)..margin(horizontal: 32.w),
                        child: StaggeredGridView.countBuilder(
                          padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          itemCount: homeController.listMenuHome.length,
                          itemBuilder: (_, index) => ListHomeMenuItem(item: homeController.listMenuHome[index], index: index,),
                          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                          mainAxisSpacing: 16.w,
                          crossAxisSpacing: 16.w,
                        ),
                      ),
                      SizedBox(height: 24.h,)
                    ],
                  ),
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
