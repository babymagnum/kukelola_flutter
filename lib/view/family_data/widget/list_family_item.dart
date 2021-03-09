import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/networking/model/staff_family.dart';
import 'package:kukelola_flutter/view/family_data/family_data_controller.dart';

class ListFamilyItem extends StatelessWidget {
  
  ListFamilyItem({@required this.item, @required this.index});
  
  final StaffFamilyData item;
  final int index;

  var _familiesCt = Get.find<FamilyDataController>();
  
  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Color(0xFFE9EAEA))..borderRadius(all: 8)..padding(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.name, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 14.ssp),),
          Text(item.dateOfBirth, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
          Text('${item.relation} - ${item.occupation}', style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
          SizedBox(height: 24.h,),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((item.identificationNumber ?? '') == '' ? '-' : item.identificationNumber, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                    Text(item.phone, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp),),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              ButtonLoading(
                backgroundColor: Color(0xFFF85C58),
                disable: item.loading,
                title: 'Delete',
                loading: item.loading,
                onTap: () => _familiesCt.removeData(index),
                textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 10.ssp),
                verticalPadding: 5.h,
                horizontalPadding: 17.w,
                borderRadius: 4,
                loadingSize: 10.w,
              )
            ],
          )
        ],
      ),
    );
  }
}
