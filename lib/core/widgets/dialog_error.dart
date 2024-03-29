import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/button_loading_bordered.dart';

class DialogError extends StatelessWidget {

  DialogError({Key key, this.button2, this.button2Click, this.icons, @required this.error, @required this.button, @required this.buttonClick}): super(key: key);

  final String error;
  final String button;
  final Function buttonClick;
  final IconData icons;
  final String button2;
  final Function button2Click;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Parent(
          style: ParentStyle()..margin(horizontal: 24.w)..borderRadius(all: 6)..background.color(Colors.white)..padding(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icons == null ? Icons.error : icons, size: 70.w, color: Color(0xFF0D1522).withOpacity(0.6),),
                SizedBox(height: 16.h,),
                Text(error, textAlign: TextAlign.center, maxLines: 5, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF0D1522), fontSizeDelta: 12.ssp, decoration: TextDecoration.none),),
                SizedBox(height: 24.h,),
                button2 == null ?
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: false,
                  title: button,
                  loading: false,
                  onTap: buttonClick,
                  verticalPadding: 6.h,
                  textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                ) :
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonLoadingBordered(
                        borderColor: ThemeColor.primary,
                        disable: false,
                        title: button,
                        loading: false,
                        onTap: buttonClick,
                        verticalPadding: 6.h,
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: ThemeColor.primary, fontSizeDelta: 14.ssp),
                        borderRadius: 6,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(child: ButtonLoading(
                      backgroundColor: ThemeColor.primary,
                      disable: false,
                      title: button2,
                      loading: false,
                      onTap: button2Click,
                      verticalPadding: 6.h,
                      textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                    )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
