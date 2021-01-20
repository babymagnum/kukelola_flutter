import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class AddEducationController extends GetxController {
  var form = AddEducationForms().obs;
  var loadingSubmit = false.obs;

  updateForm(AddEducationForms value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}