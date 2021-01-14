import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class CommonFunction {

  static standartSnackbar(String content) {
    Get.snackbar(null, null, titleText: null, borderRadius: 8, maxWidth: Get.width, messageText: Text(content, style: ThemeTextStyle.robotoMedium.apply(fontSizeDelta: 16.ssp, color: Colors.white),), barBlur: 0, snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.black45, margin: EdgeInsets.only(left: Get.width * 0.07, right: Get.width * 0.5, bottom: 20.h));
  }

}