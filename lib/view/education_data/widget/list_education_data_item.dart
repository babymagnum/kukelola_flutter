import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/view/add_education/add_education_view.dart';
import 'package:kukelola_flutter/view/education_data/education_data_controller.dart';

class ListEducationDataItem extends StatelessWidget {
  
  ListEducationDataItem({@required this.item, @required this.index});
  
  final StaffEducationData item;
  final int index;

  var _educationDataCt = Get.find<EducationDataController>();
  
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16, vertical: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.educationStep, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
                Text('${item.startYear} - ${item.endYear}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                SizedBox(height: 21.h,),
                Text(item.institution, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                RichText(
                  text: TextSpan(
                      text: (item.major ?? '') == '' ? 'No Major' : item.major,
                      style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),
                      children: [
                        TextSpan(
                          text: '- ${item.score}',
                          style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),
                        )
                      ]
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ButtonLoading(
                  backgroundColor: Color(0xFF158AC9),
                  disable: false,
                  title: 'Edit',
                  loading: false,
                  onTap: () => Get.to(() => AddEducationView(index: index, item: item,)),
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                  verticalPadding: 5.h,
                  horizontalPadding: 8.w,
                  borderRadius: 4,
                  loadingSize: 10.w,
                ),
                SizedBox(height: 9.h,),
                ButtonLoading(
                  backgroundColor: Color(0xFFF85C58),
                  disable: item.loading,
                  title: 'Delete',
                  loading: item.loading,
                  onTap: () => _educationDataCt.removeData(index),
                  textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                  verticalPadding: 5.h,
                  horizontalPadding: 8.w,
                  borderRadius: 4,
                  loadingSize: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
