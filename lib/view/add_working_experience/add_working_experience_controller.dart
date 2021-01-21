import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/view/families/families_controller.dart';
import 'package:kukelola_flutter/view/working_experience/working_experience_controller.dart';

class AddWorkingExperienceController extends GetxController {
  var _workingExperienceCt = Get.find<WorkingExperienceController>();

  var form = WorkingExperienceItem().obs;
  var loadingSubmit = false.obs;

  updateForm(WorkingExperienceItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    _workingExperienceCt.addData(form.value);
    loadingSubmit.value = false;
  }
}