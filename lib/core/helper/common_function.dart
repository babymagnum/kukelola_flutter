import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
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
              onTap: () {
                if (Get.isSnackbarOpen) Get.back();
              },
              child: Text('CLOSE', style: ThemeTextStyle.biryaniHeavy.apply(color: Colors.white, fontSizeDelta: 12.ssp),),
            )
          ],
        ),
        duration: Duration(seconds: 10),
        barBlur: 5, snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black45, margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0));
  }

  static openAttachment(String fileName, String file) async {
    if ((fileName ?? '') == '') return;

    final decoded = base64.decode(file);
    final appDir = await syspaths.getTemporaryDirectory();

    if (fileName.contains('.zip')) {
      // Decode the Zip file
      final archive = ZipDecoder().decodeBytes(decoded);

      var listFile = List<File>();

      // Extract the contents of the Zip archive to disk.
      for (final file in archive) {
        final filename = file.name;

        if (file.isFile) {
          final data = file.content as List<int>;

          listFile.add(await File('${appDir.path}/$filename').writeAsBytes(data));
        }
      }

      if (listFile.length > 0) OpenFile.open(listFile[0].path);
    } else {
      final file = await File('${appDir.path}/${fileName}').writeAsBytes(decoded);
      OpenFile.open(file.path);
    }

  }
}