import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class EducationDataController extends GetxController {
  var loadingEducation = false.obs;
  var errorEducation = false.obs;
  var listEducation = List<StaffEducationData>().obs;

  populateData() async {
    loadingEducation.value = true;
    final data = await Service().staffEducation();
    loadingEducation.value = false;

    if (data?.isSuccess ?? false) {
      errorEducation.value = false;

      listEducation.clear();
      listEducation.addAll(data.data);
    } else {
      errorEducation.value = true;
    }
  }

  removeData(int index) async {
    var education = listEducation[index];
    education.loading = true;
    listEducation[index] = education;
    final data = await Service().staffEducationDelete(education.id);

    if (data?.isSuccess ?? false) {
      listEducation.removeAt(index);
      CommonFunction.standartSnackbar('Berhasil Menghapus Data Pendidikan');
    } else {
      education.loading = false;
      listEducation[index] = education;
      CommonFunction.standartSnackbar('Gagal Menghapus: ${data?.message ?? data.errors.length > 0 ? data.errors[0].toString() : 'Server Error!'}');
    }
  }

  addData(StaffEducationData item) => listEducation.add(item);

  updateData(StaffEducationData item, int index) => listEducation[index] = item;
}