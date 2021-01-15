import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ListHomeMenuItem extends StatelessWidget {
  ListHomeMenuItem({@required this.item});

  final HomeMenuItem item;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..background.color(Colors.white)..borderRadius(all: 12)
        ..padding(horizontal: 14.w),
      child: Column(
        children: [
          SizedBox(height: 12.h,),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Parent(
                  style: ParentStyle()..background.color(item.color)..width(48.w)..height(48.w)..borderRadius(all: 1000),
                  child: Center(
                    child: SvgPicture.asset(item.image, width: 20.w, height: 20.w,),
                  ),
                ),
              ),
              item.count == 0 ?
              Container() :
              Positioned(
                right: 0, top: 0,
                child: Parent(
                  style: ParentStyle()..background.color(Color(0xFF018CCA))..borderRadius(all: 1000)..padding(horizontal: 5, vertical: 1)
                    ..border(all: 2, color: Colors.white),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Text('1', style: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 8.ssp),),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 8.h,),
          Text('${item.label}\n', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF6D6D6D), fontSizeDelta: 10.ssp), maxLines: 2,),
          SizedBox(height: 12.h,)
        ],
      ),
    );
  }
}
