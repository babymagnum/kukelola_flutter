import 'package:kukelola_flutter/networking/model/leave_summary_grid.dart';

leaveSummaryGridFromJson(LeaveSummaryGrid data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<LeaveSummaryGridData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new LeaveSummaryGridData().fromJson(v));
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

Map<String, dynamic> leaveSummaryGridToJson(LeaveSummaryGrid entity) {
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

leaveSummaryGridDataFromJson(LeaveSummaryGridData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['EmployeeName'] != null) {
		data.employeeName = json['EmployeeName'].toString();
	}
	if (json['Nip'] != null) {
		data.nip = json['Nip'].toString();
	}
	if (json['LeaveType'] != null) {
		data.leaveType = json['LeaveType'].toString();
	}
	if (json['ApprovalDate'] != null) {
		data.approvalDate = json['ApprovalDate'].toString();
	}
	if (json['StartDt'] != null) {
		data.startDt = json['StartDt'].toString();
	}
	if (json['StartDate'] != null) {
		data.startDate = json['StartDate'].toString();
	}
	if (json['EndDate'] != null) {
		data.endDate = json['EndDate'].toString();
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'].toString();
	}
	if (json['TotalDays'] != null) {
		data.totalDays = json['TotalDays'] is String
				? int.tryParse(json['TotalDays'])
				: json['TotalDays'].toInt();
	}
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['SpecialLeaveId'] != null) {
		data.specialLeaveId = json['SpecialLeaveId'];
	}
	if (json['SpecialLeave'] != null) {
		data.specialLeave = json['SpecialLeave'].toString();
	}
	if (json['ClientId'] != null) {
		data.clientId = json['ClientId'].toString();
	}
	if (json['AttachmentId'] != null) {
		data.attachmentId = json['AttachmentId'].toString();
	}
	if (json['Attachment'] != null) {
		data.attachment = json['Attachment'];
	}
	if (json['loading'] != null) {
		data.loading = json['loading'];
	}
	return data;
}

Map<String, dynamic> leaveSummaryGridDataToJson(LeaveSummaryGridData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['EmployeeName'] = entity.employeeName;
	data['Nip'] = entity.nip;
	data['LeaveType'] = entity.leaveType;
	data['ApprovalDate'] = entity.approvalDate;
	data['StartDt'] = entity.startDt;
	data['StartDate'] = entity.startDate;
	data['EndDate'] = entity.endDate;
	data['JobTitle'] = entity.jobTitle;
	data['TotalDays'] = entity.totalDays;
	data['UserId'] = entity.userId;
	data['SpecialLeaveId'] = entity.specialLeaveId;
	data['SpecialLeave'] = entity.specialLeave;
	data['ClientId'] = entity.clientId;
	data['AttachmentId'] = entity.attachmentId;
	data['Attachment'] = entity.attachment;
	data['loading'] = entity.loading;
	return data;
}