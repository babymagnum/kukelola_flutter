import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/service/service.dart';
import 'package:kukelola_flutter/view/leave_summary/leave_summary_controller.dart';

class LeaveRequestController extends GetxController {
  var _leaveSummaryCt = Get.put(LeaveSummaryController());

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
    final data = await Service().submitLeaveRequest(LeaveRequest(Constant.DUMMY_USER_ID, form.value.startDate, form.value.reason, form.value.endDate, form.value.attachment, form.value.leaveType.id));
    loadingSubmit.value = false;

    if (data?.IsSuccess ?? false) {

    } else {

    }

  }
}