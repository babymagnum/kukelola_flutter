import 'package:get/get.dart';

class LoginController extends GetxController {
  var obsecure = true.obs;

  setObsecure(bool value) => obsecure.value = value;
}