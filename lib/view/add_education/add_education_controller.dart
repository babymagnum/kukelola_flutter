import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/staff_education_insert_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/education_data/education_data_controller.dart';

class AddEducationController extends GetxController {
  var _educationDataCt = Get.find<EducationDataController>();
  var listDegree = [
    CommonType('SD', 1),
    CommonType('SMP', 2),
    CommonType('SMA', 3),
    CommonType('D3', 4),
    CommonType('D4', 5),
    CommonType('S1', 6),
    CommonType('S2', 7),
    CommonType('S3', 8),
    CommonType('Other', 99),
  ];
  var form = EducationDataItem().obs;
  var loadingSubmit = false.obs;

  updateForm(EducationDataItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    final data = await Service().staffEducationInsert(StaffEducationInsertRequest(homeController.userData.value.id, form.value.educationStep, int.parse(form.value.startYear), int.parse(form.value.endYear), form.value.institution, form.value.major, form.value.score));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil submit education');
      updateForm(EducationDataItem());
      _educationDataCt.addData(data.data);
    } else {
      CommonFunction.standartSnackbar('Gagal submit education');
    }
  }
}