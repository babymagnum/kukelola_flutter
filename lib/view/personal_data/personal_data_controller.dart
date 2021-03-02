import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class PersonalDataController extends GetxController {
  var listGender = [
    CommonType('Male', 1),
    CommonType('Female', 2)
  ];
  var listReligion = [
    CommonType('Islam', 1),
    CommonType('Katolik', 2),
    CommonType('Kristen', 3),
    CommonType('Budha', 3),
  ];
  var listMarital = [
    CommonType('Single', 1),
    CommonType('Married', 2)
  ];
  var staff = StaffData().obs;
  var loadingSave = false.obs;
  var loadingStaff = false.obs;
  var errorStaff = false.obs;

  updateStaff(StaffData value) => staff.value = value;

  saveChange() async {
    loadingSave.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSave.value = false;
  }

  getStaff() async {
    loadingStaff.value = true;
    final data = await Service().staff();
    loadingStaff.value = false;

    if (data?.data != null) {
      errorStaff.value = false;
      staff.value = data.data;
    } else {
      errorStaff.value = true;
    }
  }
}