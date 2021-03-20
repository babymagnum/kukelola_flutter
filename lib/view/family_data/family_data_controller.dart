import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/networking/model/staff_family.dart';
import 'package:kukelola_flutter/networking/service/service.dart';

class FamilyDataController extends GetxController {
  var loadingFamily = false.obs;
  var errorFamily = false.obs;
  var listFamily = List<StaffFamilyData>().obs;

  populateData() async {
    loadingFamily.value = true;
    final data = await Service().staffFamily();
    loadingFamily.value = false;

    if (data?.isSuccess ?? false) {
      errorFamily.value = false;
      listFamily.clear();
      listFamily.addAll(data.data);
    } else {
      errorFamily.value = true;
    }
  }

  removeData(int index) async {
    var family = listFamily[index];
    family.loading = true;
    listFamily[index] = family;
    final data = await Service().staffFamilyDelete(family.id);

    if (data?.isSuccess ??false) {
      listFamily.removeAt(index);
      CommonFunction.standartSnackbar('Berhasil Menghapus Data Keluarga');
    } else {
      family.loading = false;
      listFamily[index] = family;
      CommonFunction.standartSnackbar('Gagal Menghapus: ${data?.message ?? data.errors.length > 0 ? data.errors[0].toString() : 'Server Error!'}');
    }
  }

  addData(StaffFamilyData item) => listFamily.add(item);

  updateData(StaffFamilyData item, int index) => listFamily[index] = item;
}