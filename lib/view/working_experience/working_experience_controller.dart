import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class WorkingExperienceController extends GetxController {
  var loadingWorkingExperience = false.obs;
  var listWorkingExperience = List<WorkingExperienceItem>().obs;

  populateData() async {
    loadingWorkingExperience.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingWorkingExperience.value = false;
  }

  removeData(int index) async {
    var data = listWorkingExperience[index];
    data.loading = true;
    listWorkingExperience[index] = data;
    await Future.delayed(Duration(seconds: 1), () {});
    listWorkingExperience.removeAt(index);
  }

  addData(WorkingExperienceItem item) => listWorkingExperience.add(item);

}