import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';

class ContainerHomeMenu extends StatelessWidget {

  ContainerHomeMenu({@required this.index, @required this.onClick, @required this.item});

  final int index;
  final ContainerHomeItem item;
  final Function onClick;

  var _containerHomeCt = Get.put(ContainerHomeController());

  Color _colorContent() {
    return index == _containerHomeCt.selectedPage.value ? Color(0xFF58A4F8) : Color(0xFFB6B6B9);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Parent(
        gesture: Gestures()..onTap(onClick),
        style: ParentStyle()..ripple(true),
        child: Obx(() => Column(
            children: [
              SizedBox(height: 5.h,),
              Parent(style: ParentStyle()..width(4.w)..height(4.w)..background.color(index == _containerHomeCt.selectedPage.value ? Color(0xFF58A4F8) : Colors.white)..borderRadius(all: 1000),),
              SizedBox(height: 3.h,),
              SvgPicture.asset(item.image, width: 16.w, height: 16.w, color: _colorContent(),),
              SizedBox(height: 4.h,),
              Text(item.label, style: index == _containerHomeCt.selectedPage.value ? ThemeTextStyle.biryaniExtraBold.apply(color: _colorContent(), fontSizeDelta: 10.ssp) : ThemeTextStyle.biryaniRegular.apply(color: _colorContent(), fontSizeDelta: 10.ssp),),
              SizedBox(height: 6.h,)
            ],
          ),
        ),
      ),
    );
  }
}
