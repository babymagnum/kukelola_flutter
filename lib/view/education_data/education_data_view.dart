import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/add_education/add_education_view.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/education_data/education_data_controller.dart';
import 'package:kukelola_flutter/view/education_data/widget/list_education_data_item.dart';

class EducationDataView extends StatelessWidget {

  var _educationDataCt = Get.put(EducationDataController(), permanent: true);

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () {
      if (_educationDataCt.listEducation.length == 0) _educationDataCt.populateData();
    });

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
                        label: 'Education Data',
                        onBack: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => _educationDataCt.loadingEducation.value?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                        width: 16.w, height: 16.w,
                      )
                    ],
                  ) :
                  _educationDataCt.errorEducation.value ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonReload(onTap: () => _educationDataCt.populateData())
                        ],
                      )
                    ],
                  ) :
                  _educationDataCt.listEducation.length == 0 ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmptyText(text: 'Empty education', textSize: 14.ssp)
                    ],
                  ) :
                  ListView.separated(
                    itemCount: _educationDataCt.listEducation.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    itemBuilder: (_, index) => ListEducationDataItem(item: _educationDataCt.listEducation[index], index: index,),
                    separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
                  )
                ),
              )
            ],
          ),
          Positioned(
            bottom: 24.w, right: 24.w,
            child: Parent(
              gesture: Gestures()..onTap(() => Get.to(AddEducationView())),
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
