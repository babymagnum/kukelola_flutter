import 'package:get/get.dart';

class CommonController extends GetxController {

  var notConnected = false.obs;
  var logout = false.obs;
  var closeApps = false.obs;
  RxDouble inputHeight = (0.0).obs;

  setInputHeight(double value) => inputHeight.value = value;
  setLogout(value) => logout.value = value;
  setCloseapps(value) => closeApps.value = value;
  setNotConnected(value) => notConnected.value = value;

  final listDrawerItem = [
    DrawerItem('Beranda', 'assets/images/printer.svg'),
    DrawerItem('Produk', 'assets/images/printer.svg'),
    DrawerItem('Riwayat Transaksi', 'assets/images/printer.svg'),
    DrawerItem('Laporan', 'assets/images/printer.svg'),
    DrawerItem('Pegawai', 'assets/images/printer.svg'),
    DrawerItem('Pelanggan', 'assets/images/printer.svg'),
    DrawerItem('Profil Saya', 'assets/images/printer.svg'),
    DrawerItem('Pengaturan', 'assets/images/printer.svg'),
    DrawerItem('FAQ', 'assets/images/printer.svg'),
  ];
}

class DrawerItem {
  DrawerItem(this.title, this.image);

  String image;
  String title;
}