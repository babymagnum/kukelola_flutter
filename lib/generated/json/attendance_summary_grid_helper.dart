import 'package:kukelola_flutter/networking/model/attendance_summary_grid.dart';

attendanceSummaryGridFromJson(AttendanceSummaryGrid data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new AttendanceSummaryGridData().fromJson(json['Data']);
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	if (json['Errors'] != null) {
		data.errors = new List<dynamic>();
		data.errors.addAll(json['Errors']);
	}
	if (json['Message'] != null) {
		data.message = json['Message'].toString();
	}
	if (json['IsSuccess'] != null) {
		data.isSuccess = json['IsSuccess'];
	}
	if (json['IsAdmin'] != null) {
		data.isAdmin = json['IsAdmin'];
	}
	if (json['IsSuperAdmin'] != null) {
		data.isSuperAdmin = json['IsSuperAdmin'];
	}
	if (json['IsFinance'] != null) {
		data.isFinance = json['IsFinance'];
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> attendanceSummaryGridToJson(AttendanceSummaryGrid entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['Data'] = entity.data.toJson();
	}
	data['Total'] = entity.total;
	if (entity.errors != null) {
		data['Errors'] =  [];
	}
	data['Message'] = entity.message;
	data['IsSuccess'] = entity.isSuccess;
	data['IsAdmin'] = entity.isAdmin;
	data['IsSuperAdmin'] = entity.isSuperAdmin;
	data['IsFinance'] = entity.isFinance;
	data['errorMessage'] = entity.errorMessage;
	return data;
}

attendanceSummaryGridDataFromJson(AttendanceSummaryGridData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['StartDate'] != null) {
		data.startDate = json['StartDate'].toString();
	}
	if (json['EndDate'] != null) {
		data.endDate = json['EndDate'].toString();
	}
	if (json['StartHour'] != null) {
		data.startHour = json['StartHour'].toString();
	}
	if (json['EndHour'] != null) {
		data.endHour = json['EndHour'].toString();
	}
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['ClientId'] != null) {
		data.clientId = json['ClientId'].toString();
	}
	if (json['AttachmentId'] != null) {
		data.attachmentId = json['AttachmentId'];
	}
	if (json['WorkflowId'] != null) {
		data.workflowId = json['WorkflowId'].toString();
	}
	if (json['Attachment'] != null) {
		data.attachment = json['Attachment'];
	}
	return data;
}

Map<String, dynamic> attendanceSummaryGridDataToJson(AttendanceSummaryGridData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['StartDate'] = entity.startDate;
	data['EndDate'] = entity.endDate;
	data['StartHour'] = entity.startHour;
	data['EndHour'] = entity.endHour;
	data['UserId'] = entity.userId;
	data['ClientId'] = entity.clientId;
	data['AttachmentId'] = entity.attachmentId;
	data['WorkflowId'] = entity.workflowId;
	data['Attachment'] = entity.attachment;
	return data;
}