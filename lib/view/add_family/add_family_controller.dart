import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/view/families/families_controller.dart';

class AddFamilyController extends GetxController {
  var _familiesCt = Get.find<FamiliesController>();

  var form = FamiliesItem().obs;
  var loadingSubmit = false.obs;

  updateForm(FamiliesItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    _familiesCt.addData(form.value);
    loadingSubmit.value = false;
  }
}