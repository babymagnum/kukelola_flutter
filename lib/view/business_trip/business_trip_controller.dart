import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class BusinessTripController extends GetxController {
  var form = BusinessTripForm().obs;
  var loadingPickFile = false.obs;
  var loadingSubmit = false.obs;

  setForm(BusinessTripForm value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;
}