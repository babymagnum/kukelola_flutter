import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class PersonalDataController extends GetxController {
  var listGender = ['Male'.tr, 'Female'.tr];
  var listReligion = ['Islam', 'Katolik', 'Kristen'];
  var listMarital = ['Married', 'Single'];

  var form = PersonalDataForm().obs;
  var loadingSave = false.obs;

  updateForm(PersonalDataForm value) => form.value = value;

  saveChange() async {
    loadingSave.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSave.value = false;
  }
}