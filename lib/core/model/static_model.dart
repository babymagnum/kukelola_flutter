import 'dart:io';
import 'package:kukelola_flutter/core/helper/text_util.dart';

class WorkflowApprovalFilterForm {
  String keyword = '';
  String periode = TextUtil.getCurrentDate('MM/yyyy');
  CommonType route = CommonType('All Route', 0);
  CommonType request = CommonType('All Request', 0);
}

class CommonType {
  String label;
  int id;

  CommonType(this.label, this.id);
}

class ChangePasswordForm {
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';
}

class LoginForm {
  String username = '';
  String password = '';
}

class SummaryMenuItems {
  SummaryMenuItems(this.image, this.label);

  String image;
  String label;
}

class WorkingExperienceItem {
  String lastPosition = '';
  String company = '';
  String location = '';
  String endYear = '';
  String duration = '';
  bool loading = false;
}

class WorkflowApprovalItem {
  String description;
  String leaveType;
  String specialLeaveType;
  String startDate;
  String endDate;
  String name;
  String placement;
  String id;
  String status;
  String attachment = 'attachment.pdf';
  bool forSuperior;
  bool loadingCancel = false;
  bool loadingApprove = false;
  bool loadingReject = false;

  WorkflowApprovalItem(this.description, this.status, this.leaveType, this.specialLeaveType, this.startDate, this.endDate, this.name, this.placement, this.id, this.forSuperior);
}

class FamiliesItem {
  String name = '';
  String relation = '';
  String id = '';
  String occupation = '';
  String dateOfBirth = '';
  String phone = '';
  bool loading = false;
}

class BusinessTripDetailForm {
  BusinessTripDetailInput airplaneBusTicket = BusinessTripDetailInput();
  BusinessTripDetailInput localTransportation = BusinessTripDetailInput();
  BusinessTripDetailInput airportParkingFuel = BusinessTripDetailInput();
  BusinessTripDetailInput housing = BusinessTripDetailInput();
  BusinessTripDetailInput meal = BusinessTripDetailInput();
  BusinessTripDetailInput laundry = BusinessTripDetailInput();
  BusinessTripDetailInput pocketMoney = BusinessTripDetailInput();
  BusinessTripDetailInput other = BusinessTripDetailInput();
}

class BusinessTripDetailInput {
  String amount = '';
  String description = '';
}

class BusinessTripForm {
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String destination = '';
  String purpose = '';
  File attachment = File('');
  bool loading = false;
}

class EducationDataItem {
  int educationStep = 0;
  String startYear = TextUtil.getCurrentDate('yyyy');
  String endYear = TextUtil.getCurrentDate('yyyy');
  String institution = '';
  String major = '';
  String score = '';
  bool loading = false;
}

class PersonalDataForm {
  String firstName = 'Arief';
  String middleName = '';
  String lastName = 'Zainuri';
  String cityOfBirth = 'Sleman';
  String dateOfBirth = '08/05/1996';
  String email = 'flaminglassoo1996@gmail.com';
  String phone = '085792810600';
  String identificationNumber = '3471120805960001';
  String gender = 'Male';
  String religion = 'Others';
  String maritalStatus = 'Married';
  String address = '';
}

class CalendarItem {
  CalendarItem(this.title, this.date, this.dateStatus, this.description);

  String title;
  String date;
  String dateStatus;
  String description;
}

class AttendanceRequestForm {
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String startHour = TextUtil.getCurrentDate('HH:mm');
  String endHour = TextUtil.getCurrentDate('HH:mm');
  String reason = '';
  File attachment = File('');
  String status = '';
}

class ReimbursmentRequestForm {
  String reason = '';
  File attachment = File('');
  String status = '';
  bool loading = false;
}

class OvertimeRequestFormObject {
  String overtimeDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String startHour = TextUtil.getCurrentDate('HH:mm');
  String endHour = TextUtil.getCurrentDate('HH:mm');
  String reason = '';
  String status = '';
  File attachment = File('');
  bool loading = false;
}

class LeaveRequestForm {
  String type = '';
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String reason = '';
  File attachment = File('');
  String status = '';
  LeaveTypeItem leaveType = LeaveTypeItem('', '');
  LeaveTypeItem specialLeaveType = LeaveTypeItem('', '');
  bool loading = false;

  bool showSpecialType() => leaveType.label == 'Special Leave';
}

class ReimbursmentDetailItem {
  ReimbursmentDetailItem(this.description, this.cost);

  String description;
  String cost;
}

class LeaveTypeItem {
  LeaveTypeItem(this.label, this.id);

  String label = '';
  String id = '';
}

class ProfileMenuItem {
  ProfileMenuItem(this.image, this.label, this.logout);

  String image;
  String label;
  bool logout;
}

class OnboardingItem {
  OnboardingItem(this.title, this.image, this.description);

  String image;
  String title;
  String description;
}

class ContainerHomeItem {
  ContainerHomeItem(this.label, this.image);

  String image;
  String label;
}

class HomeMenuItem {
  HomeMenuItem(this.label, this.image, this.count);

  String image;
  String label;
  int count;
}

class NotificationItem {
  NotificationItem(this.image, this.description, this.title, this.time, this.unread);

  String time;
  String title;
  String description;
  String image;
  bool unread;
}