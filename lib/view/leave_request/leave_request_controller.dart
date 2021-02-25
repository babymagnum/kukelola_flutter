import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = List<LeaveTypeItem>().obs;
  var listSpecialLeave = List<LeaveTypeItem>().obs;
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var form = LeaveRequestForm().obs;

  var _homeCt = Get.find<HomeController>();

  updateForm(LeaveRequestForm value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  @override
  void onInit() {
    populateLeaveType();

    super.onInit();
  }

  populateLeaveType() {
    var leaveType = [
      LeaveTypeItem('Annual Leave', '1'),
      LeaveTypeItem('Special Leave', '2'),
      LeaveTypeItem('Sick Leave', '3'),
    ];

    var specialLeave = [
      LeaveTypeItem('Wedding Leave', '1'),
      LeaveTypeItem('Born Kids Leave', '2'),
      LeaveTypeItem('Parents Meeting Leave', '3'),
    ];

    leaveType.forEach((element) => listLeaveType.add(element));
    specialLeave.forEach((element) => listSpecialLeave.add(element));
    update();
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitLeaveRequest(LeaveRequest(_homeCt.userData.value.id, form.value.startDate, form.value.reason, form.value.endDate, form.value.attachment, form.value.leaveType.id));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil melakukan submit overtime request');
      updateForm(LeaveRequestForm());
    } else {
      CommonFunction.standartSnackbar('Gagal melakukan submit overtime request');
    }
  }
}