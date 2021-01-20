import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = List<LeaveTypeItem>().obs;
  var listSpecialLeave = List<LeaveTypeItem>().obs;
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = LeaveRequestForm().obs;

  updateForm(LeaveRequestForm value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  @override
  void onInit() {
    populateLeaveType();

    super.onInit();
  }

  populateLeaveType() {
    var leaveType = [
      LeaveTypeItem('Annual Leave'),
      LeaveTypeItem('Special Leave'),
      LeaveTypeItem('Sick Leave'),
    ];

    var specialLeave = [
      LeaveTypeItem('Wedding Leave'),
      LeaveTypeItem('Born Kids Leave'),
      LeaveTypeItem('Parents Meeting Leave'),
    ];

    leaveType.forEach((element) => listLeaveType.add(element));
    specialLeave.forEach((element) => listSpecialLeave.add(element));
    update();
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    await Future.delayed(Duration(seconds: 1), () {});
    loadingSubmit.value = false;
  }
}