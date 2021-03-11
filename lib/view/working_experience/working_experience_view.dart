import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/view/add_working_experience/add_working_experience_view.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/working_experience/widget/list_working_experience_item.dart';
import 'package:kukelola_flutter/view/working_experience/working_experience_controller.dart';

class WorkingExperienceView extends StatefulWidget {
  @override
  _WorkingExperienceViewState createState() => _WorkingExperienceViewState();
}

class _WorkingExperienceViewState extends State<WorkingExperienceView> {
  var _workingExperienceCt = Get.put(WorkingExperienceController());

  @override
  void initState() {
    super.initState();

    _workingExperienceCt.populateData();
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
                        label: 'Working Experience',
                        onBack: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => _workingExperienceCt.loadingWorkingExperience.value?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                        width: 16.w, height: 16.w,
                      )
                    ],
                  ) :
                  _workingExperienceCt.errorWorkingExperience.value ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonReload(onTap: () => _workingExperienceCt.populateData()),
                        ],
                      )
                    ],
                  ) :
                  _workingExperienceCt.listWorkingExperience.length == 0 ?
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmptyText(text: 'Empty working experience', textSize: 14.ssp)
                    ],
                  ) :
                  ListView.separated(
                    itemCount: _workingExperienceCt.listWorkingExperience.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                    itemBuilder: (_, index) => ListWorkingExperienceItem(item: _workingExperienceCt.listWorkingExperience[index], index: index,),
                    separatorBuilder: (BuildContext context, int index) => Divider(height: 16.h, color: Colors.transparent,),
                  )
                ),
              )
            ],
          ),
          Positioned(
            bottom: 24.w, right: 24.w,
            child: Parent(
              gesture: Gestures()..onTap(() => Get.to(AddWorkingExperienceView())),
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
