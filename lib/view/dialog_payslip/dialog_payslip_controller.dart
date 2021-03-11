import 'dart:io';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/payslip_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'dart:convert';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

class DialogPayslipController extends GetxController {
  var loadingDownload = false.obs;
  var date = TextUtil.getCurrentDate('MM/yyyy').obs;
  var downloadSuccess = false.obs;

  setDate(String value) => date.value = value;
  setDownloadSuccess(bool value) => downloadSuccess.value = value;

  downloadPayslip() async {
    loadingDownload.value = true;
    final data = await Service().payslip(PayslipRequest(homeController.userData.value.userId, int.parse(date.split('/')[0]), int.parse(date.split('/')[1])));
    loadingDownload.value = false;

    if (data?.data != null) {
      final decoded = base64.decode(data.data);
      final appDir = await syspaths.getTemporaryDirectory();
      final file = await File('${appDir.path}/PaySlip-${homeController.userData.value.fullName}.pdf').writeAsBytes(decoded);
      final length = await file.length();
      OpenFile.open(file.path);
      downloadSuccess.value = true;
    } else {
      downloadSuccess.value = false;
      CommonFunction.standartSnackbar('Gagal mendownload file');
    }
  }
}