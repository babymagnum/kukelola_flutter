import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';

class DialogPayslipController extends GetxController {
  var loadingDownload = false.obs;
  var date = TextUtil.getCurrentDate('MM/yyyy').obs;
  var downloadSuccess = false.obs;

  setDate(String value) => date.value = value;
  setDownloadSuccess(bool value) => downloadSuccess.value = value;

  downloadPayslip() async {
    loadingDownload.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingDownload.value = false;
    downloadSuccess.value = true;
  }
}