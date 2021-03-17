import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/add_family/add_family_view.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/family_data/family_data_controller.dart';
import 'package:kukelola_flutter/view/family_data/widget/list_family_item.dart';

class FamilyDataView extends StatefulWidget {
  @override
  _FamilyDataViewState createState() => _FamilyDataViewState();
}

class _FamilyDataViewState extends State<FamilyDataView> {
  var _familiesCt = Get.put(FamilyDataController());

  @override
  void initState() {
    super.initState();

    _familiesCt.populateData();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Stack(
        children: [
          Container(width: Get.width, height: Get.height,),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top + 24.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonBack(
                        label: 'Families',
                        onBack: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => _familiesCt.loadingFamily.value?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                        width: 16.w, height: 16.w,
                      )
                    ],
                  ) :
                  _familiesCt.errorFamily.value ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonReload(onTap: () => _familiesCt.populateData()),
                        ],
                      )
                    ],
                  ) :
                  _familiesCt.listFamily.length == 0 ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmptyText(text: 'Empty family')
                    ],
                  ) :
                  ListView.separated(
                    itemCount: _familiesCt.listFamily.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    itemBuilder: (_, index) => ListFamilyItem(item: _familiesCt.listFamily[index], index: index,),
                    separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
                  )
                ),
              )
            ],
          ),
          Positioned(
            bottom: 24.w, right: 24.w,
            child: Parent(
              gesture: Gestures()..onTap(() => Get.to(AddFamilyView())),
              style: ParentStyle()..borderRadius(all: 1000)..background.color(ThemeColor.primary)
                ..height(56.w)..width(56.w)..ripple(true),
              child: Center(
                child: SvgPicture.asset('assets/images/fa-solid_plus.svg', width: (17.5).w, height: 20.h,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
