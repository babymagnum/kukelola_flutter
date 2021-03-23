// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:kukelola_flutter/networking/model/workflow_grid.dart';
import 'package:kukelola_flutter/generated/json/workflow_grid_helper.dart';
import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';
import 'package:kukelola_flutter/generated/json/overtime_summary_grid_helper.dart';
import 'package:kukelola_flutter/networking/model/total_workflow.dart';
import 'package:kukelola_flutter/generated/json/total_workflow_helper.dart';
import 'package:kukelola_flutter/networking/model/corporate_calendar.dart';
import 'package:kukelola_flutter/generated/json/corporate_calendar_helper.dart';
import 'package:kukelola_flutter/networking/model/file_attachment.dart';
import 'package:kukelola_flutter/generated/json/file_attachment_helper.dart';
import 'package:kukelola_flutter/networking/model/standart.dart';
import 'package:kukelola_flutter/generated/json/standart_helper.dart';
import 'package:kukelola_flutter/networking/model/attendance_summary_grid.dart';
import 'package:kukelola_flutter/generated/json/attendance_summary_grid_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_education.dart';
import 'package:kukelola_flutter/generated/json/staff_education_helper.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'package:kukelola_flutter/generated/json/user_helper.dart';
import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';
import 'package:kukelola_flutter/generated/json/overtime_request_post_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_family.dart';
import 'package:kukelola_flutter/generated/json/staff_family_helper.dart';
import 'package:kukelola_flutter/networking/model/special_leave_list.dart';
import 'package:kukelola_flutter/generated/json/special_leave_list_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_education_insert.dart';
import 'package:kukelola_flutter/generated/json/staff_education_insert_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_experience_insert.dart';
import 'package:kukelola_flutter/generated/json/staff_experience_insert_helper.dart';
import 'package:kukelola_flutter/networking/model/payslip.dart';
import 'package:kukelola_flutter/generated/json/payslip_helper.dart';
import 'package:kukelola_flutter/networking/model/notification.dart';
import 'package:kukelola_flutter/generated/json/notification_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_family_insert.dart';
import 'package:kukelola_flutter/generated/json/staff_family_insert_helper.dart';
import 'package:kukelola_flutter/networking/model/leave_summary_grid.dart';
import 'package:kukelola_flutter/generated/json/leave_summary_grid_helper.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/generated/json/token_helper.dart';
import 'package:kukelola_flutter/networking/model/staff_experience.dart';
import 'package:kukelola_flutter/generated/json/staff_experience_helper.dart';
import 'package:kukelola_flutter/networking/model/reimbursment_summary_grid.dart';
import 'package:kukelola_flutter/generated/json/reimbursment_summary_grid_helper.dart';
import 'package:kukelola_flutter/networking/model/staff.dart';
import 'package:kukelola_flutter/generated/json/staff_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case WorkflowGrid:
				return workflowGridFromJson(data as WorkflowGrid, json) as T;
			case WorkflowGridData:
				return workflowGridDataFromJson(data as WorkflowGridData, json) as T;
			case OvertimeSummaryGrid:
				return overtimeSummaryGridFromJson(data as OvertimeSummaryGrid, json) as T;
			case OvertimeSummaryGridData:
				return overtimeSummaryGridDataFromJson(data as OvertimeSummaryGridData, json) as T;
			case TotalWorkflow:
				return totalWorkflowFromJson(data as TotalWorkflow, json) as T;
			case CorporateCalendar:
				return corporateCalendarFromJson(data as CorporateCalendar, json) as T;
			case CorporateCalendarData:
				return corporateCalendarDataFromJson(data as CorporateCalendarData, json) as T;
			case FileAttachment:
				return fileAttachmentFromJson(data as FileAttachment, json) as T;
			case FileAttachmentData:
				return fileAttachmentDataFromJson(data as FileAttachmentData, json) as T;
			case Standart:
				return standartFromJson(data as Standart, json) as T;
			case AttendanceSummaryGrid:
				return attendanceSummaryGridFromJson(data as AttendanceSummaryGrid, json) as T;
			case AttendanceSummaryGridData:
				return attendanceSummaryGridDataFromJson(data as AttendanceSummaryGridData, json) as T;
			case StaffEducation:
				return staffEducationFromJson(data as StaffEducation, json) as T;
			case StaffEducationData:
				return staffEducationDataFromJson(data as StaffEducationData, json) as T;
			case User:
				return userFromJson(data as User, json) as T;
			case UserData:
				return userDataFromJson(data as UserData, json) as T;
			case UserDataProfilePicture:
				return userDataProfilePictureFromJson(data as UserDataProfilePicture, json) as T;
			case OvertimeRequestPost:
				return overtimeRequestPostFromJson(data as OvertimeRequestPost, json) as T;
			case OvertimeRequestPostData:
				return overtimeRequestPostDataFromJson(data as OvertimeRequestPostData, json) as T;
			case OvertimeRequestPostDataRequest:
				return overtimeRequestPostDataRequestFromJson(data as OvertimeRequestPostDataRequest, json) as T;
			case OvertimeRequestPostDataRequestData:
				return overtimeRequestPostDataRequestDataFromJson(data as OvertimeRequestPostDataRequestData, json) as T;
			case OvertimeRequestPostDataWorkflow:
				return overtimeRequestPostDataWorkflowFromJson(data as OvertimeRequestPostDataWorkflow, json) as T;
			case OvertimeRequestPostDataWorkflowData:
				return overtimeRequestPostDataWorkflowDataFromJson(data as OvertimeRequestPostDataWorkflowData, json) as T;
			case StaffFamily:
				return staffFamilyFromJson(data as StaffFamily, json) as T;
			case StaffFamilyData:
				return staffFamilyDataFromJson(data as StaffFamilyData, json) as T;
			case SpecialLeaveList:
				return specialLeaveListFromJson(data as SpecialLeaveList, json) as T;
			case SpecialLeaveListData:
				return specialLeaveListDataFromJson(data as SpecialLeaveListData, json) as T;
			case StaffEducationInsert:
				return staffEducationInsertFromJson(data as StaffEducationInsert, json) as T;
			case StaffExperienceInsert:
				return staffExperienceInsertFromJson(data as StaffExperienceInsert, json) as T;
			case Payslip:
				return payslipFromJson(data as Payslip, json) as T;
			case Notification:
				return notificationFromJson(data as Notification, json) as T;
			case NotificationData:
				return notificationDataFromJson(data as NotificationData, json) as T;
			case StaffFamilyInsert:
				return staffFamilyInsertFromJson(data as StaffFamilyInsert, json) as T;
			case LeaveSummaryGrid:
				return leaveSummaryGridFromJson(data as LeaveSummaryGrid, json) as T;
			case LeaveSummaryGridData:
				return leaveSummaryGridDataFromJson(data as LeaveSummaryGridData, json) as T;
			case Token:
				return tokenFromJson(data as Token, json) as T;
			case StaffExperience:
				return staffExperienceFromJson(data as StaffExperience, json) as T;
			case StaffExperienceData:
				return staffExperienceDataFromJson(data as StaffExperienceData, json) as T;
			case ReimbursmentSummaryGrid:
				return reimbursmentSummaryGridFromJson(data as ReimbursmentSummaryGrid, json) as T;
			case ReimbursmentSummaryGridData:
				return reimbursmentSummaryGridDataFromJson(data as ReimbursmentSummaryGridData, json) as T;
			case Staff:
				return staffFromJson(data as Staff, json) as T;
			case StaffData:
				return staffDataFromJson(data as StaffData, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case WorkflowGrid:
				return workflowGridToJson(data as WorkflowGrid);
			case WorkflowGridData:
				return workflowGridDataToJson(data as WorkflowGridData);
			case OvertimeSummaryGrid:
				return overtimeSummaryGridToJson(data as OvertimeSummaryGrid);
			case OvertimeSummaryGridData:
				return overtimeSummaryGridDataToJson(data as OvertimeSummaryGridData);
			case TotalWorkflow:
				return totalWorkflowToJson(data as TotalWorkflow);
			case CorporateCalendar:
				return corporateCalendarToJson(data as CorporateCalendar);
			case CorporateCalendarData:
				return corporateCalendarDataToJson(data as CorporateCalendarData);
			case FileAttachment:
				return fileAttachmentToJson(data as FileAttachment);
			case FileAttachmentData:
				return fileAttachmentDataToJson(data as FileAttachmentData);
			case Standart:
				return standartToJson(data as Standart);
			case AttendanceSummaryGrid:
				return attendanceSummaryGridToJson(data as AttendanceSummaryGrid);
			case AttendanceSummaryGridData:
				return attendanceSummaryGridDataToJson(data as AttendanceSummaryGridData);
			case StaffEducation:
				return staffEducationToJson(data as StaffEducation);
			case StaffEducationData:
				return staffEducationDataToJson(data as StaffEducationData);
			case User:
				return userToJson(data as User);
			case UserData:
				return userDataToJson(data as UserData);
			case UserDataProfilePicture:
				return userDataProfilePictureToJson(data as UserDataProfilePicture);
			case OvertimeRequestPost:
				return overtimeRequestPostToJson(data as OvertimeRequestPost);
			case OvertimeRequestPostData:
				return overtimeRequestPostDataToJson(data as OvertimeRequestPostData);
			case OvertimeRequestPostDataRequest:
				return overtimeRequestPostDataRequestToJson(data as OvertimeRequestPostDataRequest);
			case OvertimeRequestPostDataRequestData:
				return overtimeRequestPostDataRequestDataToJson(data as OvertimeRequestPostDataRequestData);
			case OvertimeRequestPostDataWorkflow:
				return overtimeRequestPostDataWorkflowToJson(data as OvertimeRequestPostDataWorkflow);
			case OvertimeRequestPostDataWorkflowData:
				return overtimeRequestPostDataWorkflowDataToJson(data as OvertimeRequestPostDataWorkflowData);
			case StaffFamily:
				return staffFamilyToJson(data as StaffFamily);
			case StaffFamilyData:
				return staffFamilyDataToJson(data as StaffFamilyData);
			case SpecialLeaveList:
				return specialLeaveListToJson(data as SpecialLeaveList);
			case SpecialLeaveListData:
				return specialLeaveListDataToJson(data as SpecialLeaveListData);
			case StaffEducationInsert:
				return staffEducationInsertToJson(data as StaffEducationInsert);
			case StaffExperienceInsert:
				return staffExperienceInsertToJson(data as StaffExperienceInsert);
			case Payslip:
				return payslipToJson(data as Payslip);
			case Notification:
				return notificationToJson(data as Notification);
			case NotificationData:
				return notificationDataToJson(data as NotificationData);
			case StaffFamilyInsert:
				return staffFamilyInsertToJson(data as StaffFamilyInsert);
			case LeaveSummaryGrid:
				return leaveSummaryGridToJson(data as LeaveSummaryGrid);
			case LeaveSummaryGridData:
				return leaveSummaryGridDataToJson(data as LeaveSummaryGridData);
			case Token:
				return tokenToJson(data as Token);
			case StaffExperience:
				return staffExperienceToJson(data as StaffExperience);
			case StaffExperienceData:
				return staffExperienceDataToJson(data as StaffExperienceData);
			case ReimbursmentSummaryGrid:
				return reimbursmentSummaryGridToJson(data as ReimbursmentSummaryGrid);
			case ReimbursmentSummaryGridData:
				return reimbursmentSummaryGridDataToJson(data as ReimbursmentSummaryGridData);
			case Staff:
				return staffToJson(data as Staff);
			case StaffData:
				return staffDataToJson(data as StaffData);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (WorkflowGrid).toString()){
			return WorkflowGrid().fromJson(json);
		}	else if(type == (WorkflowGridData).toString()){
			return WorkflowGridData().fromJson(json);
		}	else if(type == (OvertimeSummaryGrid).toString()){
			return OvertimeSummaryGrid().fromJson(json);
		}	else if(type == (OvertimeSummaryGridData).toString()){
			return OvertimeSummaryGridData().fromJson(json);
		}	else if(type == (TotalWorkflow).toString()){
			return TotalWorkflow().fromJson(json);
		}	else if(type == (CorporateCalendar).toString()){
			return CorporateCalendar().fromJson(json);
		}	else if(type == (CorporateCalendarData).toString()){
			return CorporateCalendarData().fromJson(json);
		}	else if(type == (FileAttachment).toString()){
			return FileAttachment().fromJson(json);
		}	else if(type == (FileAttachmentData).toString()){
			return FileAttachmentData().fromJson(json);
		}	else if(type == (Standart).toString()){
			return Standart().fromJson(json);
		}	else if(type == (AttendanceSummaryGrid).toString()){
			return AttendanceSummaryGrid().fromJson(json);
		}	else if(type == (AttendanceSummaryGridData).toString()){
			return AttendanceSummaryGridData().fromJson(json);
		}	else if(type == (StaffEducation).toString()){
			return StaffEducation().fromJson(json);
		}	else if(type == (StaffEducationData).toString()){
			return StaffEducationData().fromJson(json);
		}	else if(type == (User).toString()){
			return User().fromJson(json);
		}	else if(type == (UserData).toString()){
			return UserData().fromJson(json);
		}	else if(type == (UserDataProfilePicture).toString()){
			return UserDataProfilePicture().fromJson(json);
		}	else if(type == (OvertimeRequestPost).toString()){
			return OvertimeRequestPost().fromJson(json);
		}	else if(type == (OvertimeRequestPostData).toString()){
			return OvertimeRequestPostData().fromJson(json);
		}	else if(type == (OvertimeRequestPostDataRequest).toString()){
			return OvertimeRequestPostDataRequest().fromJson(json);
		}	else if(type == (OvertimeRequestPostDataRequestData).toString()){
			return OvertimeRequestPostDataRequestData().fromJson(json);
		}	else if(type == (OvertimeRequestPostDataWorkflow).toString()){
			return OvertimeRequestPostDataWorkflow().fromJson(json);
		}	else if(type == (OvertimeRequestPostDataWorkflowData).toString()){
			return OvertimeRequestPostDataWorkflowData().fromJson(json);
		}	else if(type == (StaffFamily).toString()){
			return StaffFamily().fromJson(json);
		}	else if(type == (StaffFamilyData).toString()){
			return StaffFamilyData().fromJson(json);
		}	else if(type == (SpecialLeaveList).toString()){
			return SpecialLeaveList().fromJson(json);
		}	else if(type == (SpecialLeaveListData).toString()){
			return SpecialLeaveListData().fromJson(json);
		}	else if(type == (StaffEducationInsert).toString()){
			return StaffEducationInsert().fromJson(json);
		}	else if(type == (StaffExperienceInsert).toString()){
			return StaffExperienceInsert().fromJson(json);
		}	else if(type == (Payslip).toString()){
			return Payslip().fromJson(json);
		}	else if(type == (Notification).toString()){
			return Notification().fromJson(json);
		}	else if(type == (NotificationData).toString()){
			return NotificationData().fromJson(json);
		}	else if(type == (StaffFamilyInsert).toString()){
			return StaffFamilyInsert().fromJson(json);
		}	else if(type == (LeaveSummaryGrid).toString()){
			return LeaveSummaryGrid().fromJson(json);
		}	else if(type == (LeaveSummaryGridData).toString()){
			return LeaveSummaryGridData().fromJson(json);
		}	else if(type == (Token).toString()){
			return Token().fromJson(json);
		}	else if(type == (StaffExperience).toString()){
			return StaffExperience().fromJson(json);
		}	else if(type == (StaffExperienceData).toString()){
			return StaffExperienceData().fromJson(json);
		}	else if(type == (ReimbursmentSummaryGrid).toString()){
			return ReimbursmentSummaryGrid().fromJson(json);
		}	else if(type == (ReimbursmentSummaryGridData).toString()){
			return ReimbursmentSummaryGridData().fromJson(json);
		}	else if(type == (Staff).toString()){
			return Staff().fromJson(json);
		}	else if(type == (StaffData).toString()){
			return StaffData().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<WorkflowGrid>[] is M){
			return data.map<WorkflowGrid>((e) => WorkflowGrid().fromJson(e)).toList() as M;
		}	else if(<WorkflowGridData>[] is M){
			return data.map<WorkflowGridData>((e) => WorkflowGridData().fromJson(e)).toList() as M;
		}	else if(<OvertimeSummaryGrid>[] is M){
			return data.map<OvertimeSummaryGrid>((e) => OvertimeSummaryGrid().fromJson(e)).toList() as M;
		}	else if(<OvertimeSummaryGridData>[] is M){
			return data.map<OvertimeSummaryGridData>((e) => OvertimeSummaryGridData().fromJson(e)).toList() as M;
		}	else if(<TotalWorkflow>[] is M){
			return data.map<TotalWorkflow>((e) => TotalWorkflow().fromJson(e)).toList() as M;
		}	else if(<CorporateCalendar>[] is M){
			return data.map<CorporateCalendar>((e) => CorporateCalendar().fromJson(e)).toList() as M;
		}	else if(<CorporateCalendarData>[] is M){
			return data.map<CorporateCalendarData>((e) => CorporateCalendarData().fromJson(e)).toList() as M;
		}	else if(<FileAttachment>[] is M){
			return data.map<FileAttachment>((e) => FileAttachment().fromJson(e)).toList() as M;
		}	else if(<FileAttachmentData>[] is M){
			return data.map<FileAttachmentData>((e) => FileAttachmentData().fromJson(e)).toList() as M;
		}	else if(<Standart>[] is M){
			return data.map<Standart>((e) => Standart().fromJson(e)).toList() as M;
		}	else if(<AttendanceSummaryGrid>[] is M){
			return data.map<AttendanceSummaryGrid>((e) => AttendanceSummaryGrid().fromJson(e)).toList() as M;
		}	else if(<AttendanceSummaryGridData>[] is M){
			return data.map<AttendanceSummaryGridData>((e) => AttendanceSummaryGridData().fromJson(e)).toList() as M;
		}	else if(<StaffEducation>[] is M){
			return data.map<StaffEducation>((e) => StaffEducation().fromJson(e)).toList() as M;
		}	else if(<StaffEducationData>[] is M){
			return data.map<StaffEducationData>((e) => StaffEducationData().fromJson(e)).toList() as M;
		}	else if(<User>[] is M){
			return data.map<User>((e) => User().fromJson(e)).toList() as M;
		}	else if(<UserData>[] is M){
			return data.map<UserData>((e) => UserData().fromJson(e)).toList() as M;
		}	else if(<UserDataProfilePicture>[] is M){
			return data.map<UserDataProfilePicture>((e) => UserDataProfilePicture().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPost>[] is M){
			return data.map<OvertimeRequestPost>((e) => OvertimeRequestPost().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPostData>[] is M){
			return data.map<OvertimeRequestPostData>((e) => OvertimeRequestPostData().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPostDataRequest>[] is M){
			return data.map<OvertimeRequestPostDataRequest>((e) => OvertimeRequestPostDataRequest().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPostDataRequestData>[] is M){
			return data.map<OvertimeRequestPostDataRequestData>((e) => OvertimeRequestPostDataRequestData().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPostDataWorkflow>[] is M){
			return data.map<OvertimeRequestPostDataWorkflow>((e) => OvertimeRequestPostDataWorkflow().fromJson(e)).toList() as M;
		}	else if(<OvertimeRequestPostDataWorkflowData>[] is M){
			return data.map<OvertimeRequestPostDataWorkflowData>((e) => OvertimeRequestPostDataWorkflowData().fromJson(e)).toList() as M;
		}	else if(<StaffFamily>[] is M){
			return data.map<StaffFamily>((e) => StaffFamily().fromJson(e)).toList() as M;
		}	else if(<StaffFamilyData>[] is M){
			return data.map<StaffFamilyData>((e) => StaffFamilyData().fromJson(e)).toList() as M;
		}	else if(<SpecialLeaveList>[] is M){
			return data.map<SpecialLeaveList>((e) => SpecialLeaveList().fromJson(e)).toList() as M;
		}	else if(<SpecialLeaveListData>[] is M){
			return data.map<SpecialLeaveListData>((e) => SpecialLeaveListData().fromJson(e)).toList() as M;
		}	else if(<StaffEducationInsert>[] is M){
			return data.map<StaffEducationInsert>((e) => StaffEducationInsert().fromJson(e)).toList() as M;
		}	else if(<StaffExperienceInsert>[] is M){
			return data.map<StaffExperienceInsert>((e) => StaffExperienceInsert().fromJson(e)).toList() as M;
		}	else if(<Payslip>[] is M){
			return data.map<Payslip>((e) => Payslip().fromJson(e)).toList() as M;
		}	else if(<Notification>[] is M){
			return data.map<Notification>((e) => Notification().fromJson(e)).toList() as M;
		}	else if(<NotificationData>[] is M){
			return data.map<NotificationData>((e) => NotificationData().fromJson(e)).toList() as M;
		}	else if(<StaffFamilyInsert>[] is M){
			return data.map<StaffFamilyInsert>((e) => StaffFamilyInsert().fromJson(e)).toList() as M;
		}	else if(<LeaveSummaryGrid>[] is M){
			return data.map<LeaveSummaryGrid>((e) => LeaveSummaryGrid().fromJson(e)).toList() as M;
		}	else if(<LeaveSummaryGridData>[] is M){
			return data.map<LeaveSummaryGridData>((e) => LeaveSummaryGridData().fromJson(e)).toList() as M;
		}	else if(<Token>[] is M){
			return data.map<Token>((e) => Token().fromJson(e)).toList() as M;
		}	else if(<StaffExperience>[] is M){
			return data.map<StaffExperience>((e) => StaffExperience().fromJson(e)).toList() as M;
		}	else if(<StaffExperienceData>[] is M){
			return data.map<StaffExperienceData>((e) => StaffExperienceData().fromJson(e)).toList() as M;
		}	else if(<ReimbursmentSummaryGrid>[] is M){
			return data.map<ReimbursmentSummaryGrid>((e) => ReimbursmentSummaryGrid().fromJson(e)).toList() as M;
		}	else if(<ReimbursmentSummaryGridData>[] is M){
			return data.map<ReimbursmentSummaryGridData>((e) => ReimbursmentSummaryGridData().fromJson(e)).toList() as M;
		}	else if(<Staff>[] is M){
			return data.map<Staff>((e) => Staff().fromJson(e)).toList() as M;
		}	else if(<StaffData>[] is M){
			return data.map<StaffData>((e) => StaffData().fromJson(e)).toList() as M;
		}
		throw Exception("not fond");
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}