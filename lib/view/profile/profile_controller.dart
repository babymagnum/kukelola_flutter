import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class ProfileController extends GetxController {
  var listProfileMenu = List<ProfileMenuItem>().obs;
  
  populateProfileMenu(BuildContext context) {
    var list = [
      ProfileMenuItem('assets/images/fa-solid_user-circle.svg', 'Personal Data', false),
      ProfileMenuItem('assets/images/fa-solid_graduation-cap.svg', 'Education Data', false),
      ProfileMenuItem('assets/images/fa-solid_house-user.svg', 'Family Data', false),
      ProfileMenuItem('assets/images/fa-solid_suitcase.svg', 'Working Experience', false),
      ProfileMenuItem('assets/images/fa_lock_blue.svg', 'Change Password', false),
      ProfileMenuItem('assets/images/fa-solid_sign-out-alt.svg', 'Logout', true),
    ];

    list.forEach((element) => listProfileMenu.add(element));
    update();
  }
}