import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';
import 'package:kukelola_flutter/view/home/widget/list_home_menu_item.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>  with AutomaticKeepAliveClientMixin<HomeView>  {

  var _homeCt = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _homeCt.populateMenu(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                width: Get.width, height: Get.height, color: Color(0xFFFAFAFA),
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
                      child: AccountImage(url: 'aksdjobs', size: Size(64.w, 64.w), boxFit: BoxFit.fill),
                    ),
                    SizedBox(height: 14.h,),
                    Text('NEWT SAALAMANDER', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 20.ssp, color: Color(0xFF404040)),),
                    SizedBox(height: 2.h,),
                    Text('Field Officer', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
                    SizedBox(height: 2.h,),
                    Text('PT. App KuKulola ID', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 11.ssp, color: Color(0xFF404040)),),
                    SizedBox(height: 18.h,),
                    Parent(
                      style: ParentStyle()..background.color(Color(0xFFF3F3F3))..borderRadius(all: 16)..width(Get.width)..margin(horizontal: 32.w),
                      child: StaggeredGridView.countBuilder(
                        padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        itemCount: _homeCt.listMenuHome.length,
                        itemBuilder: (_, index) => ListHomeMenuItem(item: _homeCt.listMenuHome[index]),
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
    );
  }

  @override bool get wantKeepAlive => true;
}
