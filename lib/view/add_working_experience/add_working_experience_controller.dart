import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/staff_experience_insert_request.dart';
import 'package:kukelola_flutter/networking/request/staff_experience_update_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/working_experience/working_experience_controller.dart';

class AddWorkingExperienceController extends GetxController {
  var _workingExperienceCt = Get.find<WorkingExperienceController>();

  var form = WorkingExperienceItem().obs;
  var loadingSubmit = false.obs;

  updateForm(WorkingExperienceItem value) => form.value = value;

  submitExperience() async {
    loadingSubmit.value = true;
    final data = await Service().staffExperienceInsert(StaffExperienceInsertRequest(homeController.userData.value.staffId, form.value.lastPosition, form.value.company, form.value.location, int.parse(form.value.endYear), form.value.duration));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      _workingExperienceCt.addData(data.data);
      updateForm(WorkingExperienceItem());
      CommonFunction.standartSnackbar('Berhasil Menambahkan Pengalaman Kerja');
    } else {
      CommonFunction.standartSnackbar('Gagal Menambahkan: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }

  updateExperience(String id, int index) async {
    loadingSubmit.value = true;
    final data = await Service().staffExperienceUpdate(StaffExperienceUpdateRequest(id, homeController.userData.value.staffId, form.value.lastPosition, form.value.company, form.value.location, int.parse(form.value.endYear), form.value.duration));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      _workingExperienceCt.updateData(data.data, index);
      CommonFunction.standartSnackbar('Berhasil Memperbarui Pengalaman Kerja');
    } else {
      CommonFunction.standartSnackbar('Gagal Memperbarui: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}