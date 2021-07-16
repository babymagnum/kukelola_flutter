import 'dart:convert';

import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/generated/json/token_helper.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class PersonalDataController extends GetxController {
  var listGender = [
    CommonType('Male', 1),
    CommonType('Female', 2)
  ];
  var listReligion = [
    CommonType('Islam', 1),
    CommonType('Catholic', 2),
    CommonType('Protestant', 3),
    CommonType('Hinduism', 4),
    CommonType('Buddhism', 5),
    CommonType('Confucius', 6),
    CommonType('Other', 99),
  ];
  var listMarital = [
    CommonType('Married', 1),
    CommonType('Single', 2)
  ];
  var errorMessage = ''.obs;
  var staff = StaffData().obs;
  var loadingSave = false.obs;
  var loadingStaff = false.obs;
  var errorStaff = false.obs;

  updateStaff(StaffData value) => staff.value = value;

  saveChange() async {
    loadingSave.value = true;
    final data = await Service().updateStaff(staff.value.getJsonBody());
    loadingSave.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil Memperbarui Data Profile');
      homeController.userData.value.lastName = staff.value.lastName;
      homeController.userData.value.firstName = staff.value.firstName;
      homeController.userData.value.middleName = staff.value.middleName;
      homeController.userData.value.lastName = staff.value.lastName;
      homeController.userData.value.fullName = '${staff.value.firstName}${staff.value.middleName == '' ? '' : ' ${staff.value.middleName}'}${staff.value.lastName == '' ? '' : ' ${staff.value.lastName}'}';
      String token = jsonEncode(tokenFromJson(Token(), homeController.userData.value.toJson()));
      await commonController.preferences.setString(Constant.OBJECT_TOKEN, token);
      homeController.getUser();
    } else {
      CommonFunction.standartSnackbar('Gagal Memperbarui: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
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

      if (data.errors.length > 0) errorMessage.value = data.errors[0];
      else errorMessage.value = data.message;
    }
  }
}