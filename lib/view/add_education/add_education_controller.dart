import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/view/education_data/education_data_controller.dart';

class AddEducationController extends GetxController {
  var _educationDataCt = Get.find<EducationDataController>();

  var listDegree = ['University', 'High School', 'Middle School'];
  var form = EducationDataItem().obs;
  var loadingSubmit = false.obs;

  updateForm(EducationDataItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    _educationDataCt.addData(form.value);
    loadingSubmit.value = false;
  }
}