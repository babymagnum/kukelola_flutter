import 'package:get/get.dart';
import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';
import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/networking/model/staff_education_insert.dart';
import 'package:kukelola_flutter/networking/model/staff_experience.dart';
import 'package:kukelola_flutter/networking/model/staff_experience_insert.dart';
import 'package:kukelola_flutter/networking/model/staff_family.dart';
import 'package:kukelola_flutter/networking/model/staff_family_insert.dart';
import 'package:kukelola_flutter/networking/model/standart.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'package:kukelola_flutter/networking/request/attendance_online_request.dart';
import 'package:kukelola_flutter/networking/request/attendance_request.dart';
import 'package:kukelola_flutter/networking/request/business_trip_request.dart';
import 'package:kukelola_flutter/networking/request/change_password_request.dart';
import 'package:kukelola_flutter/networking/request/leave_request.dart';
import 'package:kukelola_flutter/networking/request/login_request.dart';
import 'package:kukelola_flutter/networking/request/overtime_request.dart';
import 'package:kukelola_flutter/networking/request/reimbursment_request.dart';
import 'package:kukelola_flutter/networking/request/reject_request.dart';
import 'package:kukelola_flutter/networking/request/staff_education_insert_request.dart';
import 'package:kukelola_flutter/networking/request/staff_experience_insert_request.dart';
import 'package:kukelola_flutter/networking/request/staff_family_insert_request.dart';
import 'package:kukelola_flutter/networking/service/base_service.dart';
import 'package:kukelola_flutter/view/home/home_controller.dart';
import '../../main.dart';

class Service extends BaseService {

  var _homeCt = Get.find<HomeController>();

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
      'Id': id
    });
  }

  Future<Standart> rejectRequest(RejectRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/Workflow/Reject', request.getBody());
  }

  Future<Standart> cancelRequest(String id) async {
    return await postJsonBody('${MyApp.BASE_API}api/Workflow/Cancel', {
      'Id': id
    });
  }
  
  Future<SpecialLeaveList> specialLeaveList() async {
    return await postJsonBody('${MyApp.BASE_API}api/SpecialLeave/SpecialLeaveList', {
      'Text': ''
    });
  }

  Future<Standart> attendanceOnline(AttendanceOnlineRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/Attendance/Online', request.getBody());
  }

  Future<Standart> businessTripRequest(BusinessTripRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/BusinessTripRequest/SubmitRequest', await request.getBody());
  }
  
  Future<CorporateCalendar> corporateCalendar(String text) async {
    return await postJsonBody('${MyApp.BASE_API}api/CorporateCalendar/Grid', {'Text': text});
  }
  
  Future<Standart> logout() async {
    return await post('${MyApp.BASE_API}api/User/Logout');
  }
  
  Future<Staff> staff() async {
    return await get('${MyApp.BASE_API}api/Staff/${_homeCt.userData.value.id}');
  }

  Future<StaffEducation> staffEducation() async {
    return await get('${MyApp.BASE_API}api/StaffEducation/EducationList?StaffId=${_homeCt.userData.value.id}');
  }

  Future<StaffEducationInsert> staffEducationInsert(StaffEducationInsertRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/StaffEducation', request.getBody());
  }

  Future<Standart> staffEducationDelete(String id) async {
    return await delete('${MyApp.BASE_API}api/StaffEducation/Delete?id=$id');
  }

  Future<StaffExperience> staffExperience() async {
    return await get('${MyApp.BASE_API}api/StaffExperience/ExperienceList?StaffId=${_homeCt.userData.value.id}');
  }

  Future<StaffExperienceInsert> staffExperienceInsert(StaffExperienceInsertRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/StaffExperience', request.getBody());
  }

  Future<Standart> staffExperienceDelete(String id) async {
    return await delete('${MyApp.BASE_API}api/StaffExperience/Delete?id=$id');
  }

  Future<StaffFamily> staffFamily() async {
    return await get('${MyApp.BASE_API}api/StaffFamily/FamilyList?StaffId=${_homeCt.userData.value.id}');
  }

  Future<StaffFamilyInsert> staffFamilyInsert(StaffFamilyInsertRequest request) async {
    return await postJsonBody('${MyApp.BASE_API}api/StaffFamily', request.getBody());
  }

  Future<Standart> staffFamilyDelete(String id) async {
    return await delete('${MyApp.BASE_API}api/StaffFamily/Delete?id=$id');
  }
}