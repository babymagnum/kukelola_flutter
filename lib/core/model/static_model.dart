import 'dart:convert';
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

  WorkingExperienceItem();

  WorkingExperienceItem.updateData(String lastPosition, String company, String location, String endYear, String duration) {
    this.lastPosition = lastPosition;
    this.company = company;
    this.location = location;
    this.endYear = endYear;
    this.duration = duration;
  }
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

  FamiliesItem();

  FamiliesItem.updateData(String name, String relation, String id, String occupation, String dateOfBirth, String phone) {
    this.name = name;
    this.relation = relation;
    this.id = id;
    this.occupation = occupation;
    this.dateOfBirth = dateOfBirth;
    this.phone = phone;
  }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['airplaneBusTicket'] = airplaneBusTicket.toJson();
    data['localTransportation'] = localTransportation.toJson();
    data['airportParkingFuel'] = airportParkingFuel.toJson();
    data['housing'] = housing.toJson();
    data['meal'] = meal.toJson();
    data['laundry'] = laundry.toJson();
    data['pocketMoney'] = pocketMoney.toJson();
    data['other'] = other.toJson();
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    airplaneBusTicket = airplaneBusTicket.fromJson(json['airplaneBusTicket']);
    localTransportation = localTransportation.fromJson(json['localTransportation']);
    airportParkingFuel = airportParkingFuel.fromJson(json['airportParkingFuel']);
    housing = housing.fromJson(json['housing']);
    meal = meal.fromJson(json['meal']);
    laundry = laundry.fromJson(json['laundry']);
    pocketMoney = pocketMoney.fromJson(json['pocketMoney']);
    other = other.fromJson(json['other']);
    return this;
  }
}

class BusinessTripDetailInput {
  String amount = '';
  String description = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['description'] = description;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    amount = json['amount'].toString();
    description = json['description'].toString();
    return this;
  }
}

class BusinessTripForm {
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String destination = '';
  String purpose = '';
  File attachment = File('');
  bool loading = false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['destination'] = destination;
    data['purpose'] = purpose;
    data['attachment'] = attachment.path;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    attachment = File('${json['attachment'].toString()}');
    startDate = json['startDate'].toString();
    endDate = json['endDate'].toString();
    destination = json['destination'].toString();
    purpose = json['purpose'].toString();
    return this;
  }
}

class EducationDataItem {
  int educationStep = 0;
  String startYear = TextUtil.getCurrentDate('yyyy');
  String endYear = TextUtil.getCurrentDate('yyyy');
  String institution = '';
  String major = '';
  String score = '';

  EducationDataItem();

  EducationDataItem.updateData(int educationStep, String startYear, String endYear, String institution, String major, String score) {
    this.educationStep = educationStep;
    this.startYear = startYear;
    this.endYear = endYear;
    this.institution = institution;
    this.major = major;
    this.score = score;
  }
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

class StringFile {
  String path = '';

  StringFile();

  StringFile.standartConstructor(String path) {
    this.path = path;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['path'] = path;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    path = json['path'];
    return this;
  }
}

class AttendanceRequestForm {
  String startDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String endDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String startHour = TextUtil.getCurrentDate('HH:mm');
  String endHour = TextUtil.getCurrentDate('HH:mm');
  String reason = '';
  List<StringFile> listFile = [];
  String status = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['startHour'] = startHour;
    data['endHour'] = endHour;
    data['reason'] = reason;
    data['status'] = status;
    data['listFile'] = jsonEncode(listFile.map((e) => e.toJson()).toList());
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    listFile = (jsonDecode(json['listFile'].toString()) as List).map((i) => StringFile().fromJson(i) as StringFile).toList();
    startDate = json['startDate'].toString();
    endDate = json['endDate'].toString();
    startHour = json['startHour'].toString();
    endHour = json['endHour'].toString();
    reason = json['reason'].toString();
    status = json['status'].toString();
    return this;
  }
}

class ReimbursmentRequestForm {
  String reason = '';
  File attachment = File('');
  String status = '';
  List<ReimbursmentDetailItem> listDetail = [];
  bool loading = false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['reason'] = reason;
    data['attachment'] = attachment.path;
    data['status'] = status;
    data['listDetail'] = jsonEncode(listDetail.map((e) => e.toJson()).toList());
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    attachment = File('${json['attachment'].toString()}');
    listDetail = (jsonDecode(json['listDetail'].toString()) as List).map((i) => ReimbursmentDetailItem().fromJson(i) as ReimbursmentDetailItem).toList();
    reason = json['reason'].toString();
    status = json['status'].toString();
    return this;
  }
}

class OvertimeRequestFormObject {
  String overtimeDate = TextUtil.getCurrentDate('dd/MM/yyyy');
  String startHour = TextUtil.getCurrentDate('HH:mm');
  String endHour = TextUtil.getCurrentDate('HH:mm');
  String reason = '';
  String status = '';
  File attachment = File('');
  bool loading = false;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['overtimeDate'] = overtimeDate;
    data['startHour'] = startHour;
    data['endHour'] = endHour;
    data['reason'] = reason;
    data['status'] = status;
    data['attachment'] = attachment.path;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    attachment = File('${json['attachment'].toString()}');
    overtimeDate = json['overtimeDate'].toString();
    startHour = json['startHour'].toString();
    endHour = json['endHour'].toString();
    reason = json['reason'].toString();
    status = json['status'].toString();
    return this;
  }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['reason'] = reason;
    data['attachment'] = attachment.path;
    data['status'] = status;
    data['leaveType'] = leaveType.toJson();
    data['specialLeaveType'] = specialLeaveType.toJson();
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    attachment = File('${json['attachment'].toString()}');
    type = json['type'].toString();
    startDate = json['startDate'].toString();
    endDate = json['endDate'].toString();
    reason = json['reason'].toString();
    status = json['status'].toString();
    leaveType = leaveType.fromJson(json['leaveType']);
    specialLeaveType = specialLeaveType.fromJson(json['specialLeaveType']);
    return this;
  }
}

class ReimbursmentDetailItem {
  String description;
  String cost;

  ReimbursmentDetailItem();

  ReimbursmentDetailItem.standartConstructor(this.description, this.cost) {
    this.description = description;
    this.cost = cost;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['description'] = description;
    data['cost'] = cost;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    description = json['description'].toString();
    cost = json['cost'].toString();
    return this;
  }
}

class LeaveTypeItem {
  LeaveTypeItem(this.label, this.id);

  String label = '';
  String id = '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = label;
    data['id'] = id;
    return data;
  }

  fromJson(Map<String, dynamic> json) {
    label = json['label'].toString();
    id = json['id'].toString();
    return this;
  }
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