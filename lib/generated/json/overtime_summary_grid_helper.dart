import 'package:kukelola_flutter/networking/model/overtime_summary_grid.dart';

overtimeSummaryGridFromJson(OvertimeSummaryGrid data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<OvertimeSummaryGridData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new OvertimeSummaryGridData().fromJson(v));
		});
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
		data.message = json['Message'];
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
	return data;
}

Map<String, dynamic> overtimeSummaryGridToJson(OvertimeSummaryGrid entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['Data'] =  entity.data.map((v) => v.toJson()).toList();
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
	return data;
}

overtimeSummaryGridDataFromJson(OvertimeSummaryGridData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['OvertimeDate'] != null) {
		data.overtimeDate = json['OvertimeDate'].toString();
	}
	if (json['OvertimeDt'] != null) {
		data.overtimeDt = json['OvertimeDt'].toString();
	}
	if (json['StartHour'] != null) {
		data.startHour = json['StartHour'].toString();
	}
	if (json['EndHour'] != null) {
		data.endHour = json['EndHour'].toString();
	}
	if (json['EmployeeName'] != null) {
		data.employeeName = json['EmployeeName'].toString();
	}
	if (json['Nip'] != null) {
		data.nip = json['Nip'].toString();
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'].toString();
	}
	if (json['TotalHours'] != null) {
		data.totalHours = json['TotalHours'] is String
				? int.tryParse(json['TotalHours'])
				: json['TotalHours'].toInt();
	}
	if (json['ApprovalDate'] != null) {
		data.approvalDate = json['ApprovalDate'].toString();
	}
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['ClientId'] != null) {
		data.clientId = json['ClientId'].toString();
	}
	if (json['AttachmentId'] != null) {
		data.attachmentId = json['AttachmentId'].toString();
	}
	if (json['WorkflowId'] != null) {
		data.workflowId = json['WorkflowId'].toString();
	}
	if (json['Attachment'] != null) {
		data.attachment = json['Attachment'];
	}
	return data;
}

Map<String, dynamic> overtimeSummaryGridDataToJson(OvertimeSummaryGridData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['OvertimeDate'] = entity.overtimeDate;
	data['OvertimeDt'] = entity.overtimeDt;
	data['StartHour'] = entity.startHour;
	data['EndHour'] = entity.endHour;
	data['EmployeeName'] = entity.employeeName;
	data['Nip'] = entity.nip;
	data['JobTitle'] = entity.jobTitle;
	data['TotalHours'] = entity.totalHours;
	data['ApprovalDate'] = entity.approvalDate;
	data['UserId'] = entity.userId;
	data['ClientId'] = entity.clientId;
	data['AttachmentId'] = entity.attachmentId;
	data['WorkflowId'] = entity.workflowId;
	data['Attachment'] = entity.attachment;
	return data;
}