import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/networking/model/staff_experience.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class WorkingExperienceController extends GetxController {
  var loadingWorkingExperience = false.obs;
  var errorWorkingExperience = false.obs;
  var listWorkingExperience = List<StaffExperienceData>().obs;

  populateData() async {
    loadingWorkingExperience.value = true;
    final data = await Service().staffExperience();
    loadingWorkingExperience.value = false;

    if (data?.isSuccess ?? false) {
      errorWorkingExperience.value = false;
      listWorkingExperience.clear();
      data.data.forEach((element) => listWorkingExperience.add(element));
    } else {
      errorWorkingExperience.value = true;
    }
  }

  removeData(int index) async {
    var experience = listWorkingExperience[index];
    experience.loading = true;
    listWorkingExperience[index] = experience;
    final data = await Service().staffExperienceDelete(experience.id);

    if (data?.isSuccess ?? false) {
      listWorkingExperience.removeAt(index);
      CommonFunction.standartSnackbar('Berhasil menghapus pengalaman kerja');
    } else {
      experience.loading = false;
      listWorkingExperience[index] = experience;
      CommonFunction.standartSnackbar('Gagal menghapus pengalaman kerja');
    }
  }

  addData(StaffExperienceData item) => listWorkingExperience.add(item);
  updateData(StaffExperienceData item, int index) => listWorkingExperience[index] = item;
}