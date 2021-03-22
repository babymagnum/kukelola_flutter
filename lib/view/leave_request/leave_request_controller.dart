import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/common_function.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';

class LeaveRequestController extends GetxController {
  var listLeaveType = [
    LeaveTypeItem('Annual Leave', '1'),
    LeaveTypeItem('Special Leave', '2'),
    LeaveTypeItem('Unpaid Leave', '3'),
  ];
  var listSpecialLeave = List<SpecialLeaveListData>();
  var loadingSubmit = false.obs;
  var loadingPickFile = false.obs;
  var loadingSpecialLeaveType = false.obs;
  var errorSpecialLeaveType = false.obs;
  var form = LeaveRequestForm().obs;

  updateForm(LeaveRequestForm value) => form.value = value;
  setLoadingPickFile(bool value) => loadingPickFile.value = value;

  populateSpecialLeaveType() async {
    if (listSpecialLeave.length > 0) return;

    loadingSpecialLeaveType.value = true;
    final data = await Service().specialLeaveList();
    loadingSpecialLeaveType.value = false;

    if (data?.data != null) {
      errorSpecialLeaveType.value = false;
      listSpecialLeave.addAll(data.data);
    } else {
      errorSpecialLeaveType.value = true;
    }
  }

  submitLeaveRequest() async {
    loadingSubmit.value = true;
    final data = await Service().submitLeaveRequest(LeaveRequest(homeController.userData.value.userId, form.value.startDate, form.value.reason, form.value.endDate, form.value.attachment, form.value.leaveType.id));
    loadingSubmit.value = false;

    if (data?.isSuccess ?? false) {
      CommonFunction.standartSnackbar('Berhasil Submit Leave Request');
      updateForm(LeaveRequestForm());
    } else {
      CommonFunction.standartSnackbar('Gagal Submit: ${data?.message != null ? data.message : data.errors.length > 0 ? data.errors[0].toString() : 'Server Error'}');
    }
  }
}