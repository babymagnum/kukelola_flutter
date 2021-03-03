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
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';
import 'package:kukelola_flutter/view/home/widget/list_home_menu_item.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with AutomaticKeepAliveClientMixin<HomeView>  {

  @override
  void initState() {
    homeController.getUser();
    homeController.populateMenu();

    super.initState();
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
        child: ButtonReload(onTap: () => homeController.getUser())
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
                        child: AccountImage(url: homeController.userData?.value?.profilePicture?.file ?? '-', size: Size(64.w, 64.w), boxFit: BoxFit.fill),
                      ),
                      SizedBox(height: 14.h,),
                      Text(homeController.userData?.value?.fullName ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 20.ssp, color: Color(0xFF404040)),),
                      SizedBox(height: 2.h,),
                      Text(homeController.userData?.value?.jobTitle ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
                      SizedBox(height: 2.h,),
                      Text('PT. App KuKelola ID', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 11.ssp, color: Color(0xFF404040)),),
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
                      )
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
