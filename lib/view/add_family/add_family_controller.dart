import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/request/staff_family_insert_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/family_data/family_data_controller.dart';

class AddFamilyController extends GetxController {
  var _familiesCt = Get.find<FamilyDataController>();
  var form = FamiliesItem().obs;
  var loadingSubmit = false.obs;

  updateForm(FamiliesItem value) => form.value = value;

  submitEducation() async {
    loadingSubmit.value = true;
    final data = await Service().staffFamilyInsert(StaffFamilyInsertRequest(homeController.userData.value.id, form.value.name, form.value.relation, form.value.id, form.value.occupation, form.value.dateOfBirth, form.value.phone));
    loadingSubmit.value = false;
    
    if (data?.isSuccess ?? false) {
      _familiesCt.addData(data.data);
      CommonFunction.standartSnackbar('Berhasil menambahkan keluarga');
    } else {
      CommonFunction.standartSnackbar('Gagal menambahkan keluarga');
    }
  }
}