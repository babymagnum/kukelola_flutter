import 'package:get/get.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var logout = false.obs;
  var closeApps = false.obs;

  setLogout(value) => logout.value = value;
  setCloseapps(value) => closeApps.value = value;
  setNotConnected(value) => notConnected.value = value;
}