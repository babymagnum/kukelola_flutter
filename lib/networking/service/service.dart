import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';
import 'package:kukelola_flutter/networking/model/standart.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'package:kukelola_flutter/networking/request/attendance_request.dart';
import 'package:kukelola_flutter/networking/request/change_password_request.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/request/login_request.dart';
import 'package:kukelola_flutter/networking/request/overtime_request.dart';
import 'package:kukelola_flutter/networking/request/reimbursment_request.dart';
import 'package:kukelola_flutter/networking/request/reject_request.dart';
import 'package:kukelola_flutter/networking/service/base_service.dart';
import '../../main.dart';

class Service extends BaseService {
  
  Future<Token> token(LoginRequest request) async {
    return await postUrlEncoded('${MyApp.BASE_API}token', request.getBody());
  }

  Future<User> account() async {
    return await get('${MyApp.BASE_API}api/User');
  }

  Future<Standart> changePassword(ChangePasswordRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/User/ChangePassword', request.body());
  }

  Future<OvertimeRequestPost> submitAttendanceRequest(AttendanceRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/AttendanceRequest/SubmitRequest', await request.body());
  }

  Future<OvertimeRequestPost> submitOvertimeRequest(OvertimeRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/OvertimeRequest/SubmitRequest', await request.body());
  }

  Future<OvertimeRequestPost> submitReimbursmentRequest(ReimbursmentRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/ReimbursementRequest/SubmitRequest', await request.body());
  }

  Future<OvertimeRequestPost> submitLeaveRequest(LeaveRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/LeaveRequest/SubmitRequest', await request.body());
  }

  Future<Standart> approveRequest(String id) async {
    return await postJsonBody('${MyApp.BASE_API}api/Workflow/Approve', {
      "Id": id
    });
  }

  Future<Standart> rejectRequest(RejectRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/Workflow/Reject', request.getBody());
  }

  Future<Standart> cancelRequest(String id) async {
    return await postJsonBody('${MyApp.BASE_API}api/Workflow/Cancel', {
      "Id": id
    });
  }
}