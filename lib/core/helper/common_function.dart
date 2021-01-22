import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class CommonFunction {

  static standartSnackbar(String content) {
    Get.snackbar(null, null, titleText: null, borderRadius: 0, maxWidth: Get.width,
        messageText: Row(
          children: [
            Expanded(
              child: Text(content, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 12.ssp, color: Colors.white),),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Text('CLOSE', style: ThemeTextStyle.biryaniHeavy.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
            )
          ],
        ),
        barBlur: 0, snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45, margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0));
  }

}