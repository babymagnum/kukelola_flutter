import 'dart:convert';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/generated/json/token_helper.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class HomeController extends GetxController {
  var listMenuHome = List<HomeMenuItem>().obs;
  // var userData = UserData().obs;
  // var user = User().obs;
  var userData = Token().obs;
  var loadingUser = false.obs;
  var errorUser = false.obs;
  var totalWorkflow = 0.obs;
  var profilePicture = ''.obs;
  var loadingProfilePicture = false.obs;
  var errorProfilePicture = false.obs;

  populateMenu() {
    listMenuHome.clear();
    listMenuHome.addAll([
      HomeMenuItem('Online\nAttendance', 'assets/images/attendance_online 1.png', 0),
      HomeMenuItem('Attendance\nRequest', 'assets/images/attendance_request 1.png', 0),
      HomeMenuItem('Overtime\nRequest', 'assets/images/overtime_request 1.png', 0),
      HomeMenuItem('Leave\nRequest', 'assets/images/leave_request 1.png', 0),
      HomeMenuItem('Business\nTrip', 'assets/images/business_trip 2.png', 0),
      HomeMenuItem('Reimbursement Request', 'assets/images/reimbursement 1.png', 0),
      HomeMenuItem('Pay Slip', 'assets/images/pay_slip 1.png', 0),
      HomeMenuItem('Approval', 'assets/images/workflow 1.png', 0),
      HomeMenuItem('Calendar', 'assets/images/calendar 1.png', 0),
    ]);
  }

  getUser() {
    Map tokenMap = jsonDecode(commonController.preferences.getString(Constant.OBJECT_TOKEN));
    var token = tokenFromJson(Token(), tokenMap) as Token;
    userData.value = token;
    getProfilePicture();
  }

  getProfilePicture() async {
    loadingProfilePicture.value = true;
    final data = await Service().fileAttachment(userData.value.profilePictureId);
    loadingProfilePicture.value = false;

    if (data?.data != null) {
      errorProfilePicture.value = false;
      profilePicture.value = data.data?.file ?? '';
    } else {
      errorProfilePicture.value = true;
    }
  }

  // getUser() async {
  //   loadingUser.value = true;
  //   final data = await Service().account();
  //   loadingUser.value = false;
  //
  //   if (data?.data != null) {
  //     user.value = data;
  //     userData.value = data.data;
  //   } else {
  //     errorUser.value = data?.data == null;
  //   }
  // }

  getTotalWorkflow() async {
    final data = await Service().totalWorkflow();

    if (data?.data != null) {
      final item = listMenuHome[7];
      item.count = data.data;
      listMenuHome[7] = item;
    }
  }
}