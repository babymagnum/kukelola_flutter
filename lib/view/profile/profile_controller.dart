import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class ProfileController extends GetxController {
  var listProfileMenu = List<ProfileMenuItem>().obs;
  
  populateProfileMenu(BuildContext context) {
    var list = [
      ProfileMenuItem('assets/images/profile_personal_data 1.png', 'Personal Data', false),
      ProfileMenuItem('assets/images/profile_education_data 2.png', 'Education Data', false),
      ProfileMenuItem('assets/images/profile_family_data 1.png', 'Family Data', false),
      ProfileMenuItem('assets/images/profile_working_exp 1.png', 'Working Experience', false),
      ProfileMenuItem('assets/images/profile_change_pass 1.png', 'Change Password', false),
      ProfileMenuItem('assets/images/fa-solid_sign-out-alt.png', 'Logout', true),
    ];

    list.clear();
    list.addAll(list);
    update();
  }
}