import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/staff_experience_insert_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/working_experience/working_experience_controller.dart';

class AddWorkingExperienceController extends GetxController {
  var _workingExperienceCt = Get.find<WorkingExperienceController>();

  var form = WorkingExperienceItem().obs;
  var loadingSubmit = false.obs;

  updateForm(WorkingExperienceItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    final data = await Service().staffExperienceInsert(StaffExperienceInsertRequest(homeController.userData.value.id, form.value.lastPosition, form.value.company, form.value.location, int.parse(form.value.endYear), form.value.duration));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      _workingExperienceCt.addData(data.data);
      CommonFunction.standartSnackbar('Berhasil menambahkan pengalaman kerja');
    } else {
      CommonFunction.standartSnackbar('Gagal menambahkan pengalaman kerja');
    }
  }
}