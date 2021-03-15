import 'package:kukelola_flutter/networking/model/overtime_request_post.dart';

overtimeRequestPostFromJson(OvertimeRequestPost data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new OvertimeRequestPostData().fromJson(json['Data']);
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
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> overtimeRequestPostToJson(OvertimeRequestPost entity) {
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

overtimeRequestPostDataFromJson(OvertimeRequestPostData data, Map<String, dynamic> json) {
	if (json['Request'] != null) {
		data.request = new OvertimeRequestPostDataRequest().fromJson(json['Request']);
	}
	if (json['Workflow'] != null) {
		data.workflow = new OvertimeRequestPostDataWorkflow().fromJson(json['Workflow']);
	}
	return data;
}

Map<String, dynamic> overtimeRequestPostDataToJson(OvertimeRequestPostData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.request != null) {
		data['Request'] = entity.request.toJson();
	}
	if (entity.workflow != null) {
		data['Workflow'] = entity.workflow.toJson();
	}
	return data;
}

overtimeRequestPostDataRequestFromJson(OvertimeRequestPostDataRequest data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new OvertimeRequestPostDataRequestData().fromJson(json['Data']);
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

Map<String, dynamic> overtimeRequestPostDataRequestToJson(OvertimeRequestPostDataRequest entity) {
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
	return data;
}

overtimeRequestPostDataRequestDataFromJson(OvertimeRequestPostDataRequestData data, Map<String, dynamic> json) {
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
		data.employeeName = json['EmployeeName'];
	}
	if (json['Nip'] != null) {
		data.nip = json['Nip'];
	}
	if (json['JobTitle'] != null) {
		data.jobTitle = json['JobTitle'];
	}
	if (json['TotalHours'] != null) {
		data.totalHours = json['TotalHours'] is String
				? int.tryParse(json['TotalHours'])
				: json['TotalHours'].toInt();
	}
	if (json['ApprovalDate'] != null) {
		data.approvalDate = json['ApprovalDate'];
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

Map<String, dynamic> overtimeRequestPostDataRequestDataToJson(OvertimeRequestPostDataRequestData entity) {
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

overtimeRequestPostDataWorkflowFromJson(OvertimeRequestPostDataWorkflow data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new OvertimeRequestPostDataWorkflowData().fromJson(json['Data']);
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

Map<String, dynamic> overtimeRequestPostDataWorkflowToJson(OvertimeRequestPostDataWorkflow entity) {
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
	return data;
}

overtimeRequestPostDataWorkflowDataFromJson(OvertimeRequestPostDataWorkflowData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name'].toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description'].toString();
	}
	if (json['RejectReason'] != null) {
		data.rejectReason = json['RejectReason'];
	}
	if (json['WorkflowType'] != null) {
		data.workflowType = json['WorkflowType'] is String
				? int.tryParse(json['WorkflowType'])
				: json['WorkflowType'].toInt();
	}
	if (json['WorkflowStatus'] != null) {
		data.workflowStatus = json['WorkflowStatus'] is String
				? int.tryParse(json['WorkflowStatus'])
				: json['WorkflowStatus'].toInt();
	}
	if (json['LevelProgress'] != null) {
		data.levelProgress = json['LevelProgress'] is String
				? int.tryParse(json['LevelProgress'])
				: json['LevelProgress'].toInt();
	}
	if (json['RequestorId'] != null) {
		data.requestorId = json['RequestorId'].toString();
	}
	if (json['RequestorName'] != null) {
		data.requestorName = json['RequestorName'].toString();
	}
	if (json['ApproverId'] != null) {
		data.approverId = json['ApproverId'].toString();
	}
	if (json['ApproverName'] != null) {
		data.approverName = json['ApproverName'].toString();
	}
	if (json['SecondApproverId'] != null) {
		data.secondApproverId = json['SecondApproverId'];
	}
	if (json['SecondApproverName'] != null) {
		data.secondApproverName = json['SecondApproverName'].toString();
	}
	if (json['CreatedBy'] != null) {
		data.createdBy = json['CreatedBy'].toString();
	}
	if (json['CreatorName'] != null) {
		data.creatorName = json['CreatorName'];
	}
	if (json['CreateDate'] != null) {
		data.createDate = json['CreateDate'].toString();
	}
	if (json['CreateTime'] != null) {
		data.createTime = json['CreateTime'].toString();
	}
	if (json['IsMyRequest'] != null) {
		data.isMyRequest = json['IsMyRequest'];
	}
	if (json['IsAdmin'] != null) {
		data.isAdmin = json['IsAdmin'];
	}
	if (json['UpdatedName'] != null) {
		data.updatedName = json['UpdatedName'];
	}
	if (json['AttachmentId'] != null) {
		data.attachmentId = json['AttachmentId'].toString();
	}
	if (json['RequestType'] != null) {
		data.requestType = json['RequestType'] is String
				? int.tryParse(json['RequestType'])
				: json['RequestType'].toInt();
	}
	return data;
}

Map<String, dynamic> overtimeRequestPostDataWorkflowDataToJson(OvertimeRequestPostDataWorkflowData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Description'] = entity.description;
	data['RejectReason'] = entity.rejectReason;
	data['WorkflowType'] = entity.workflowType;
	data['WorkflowStatus'] = entity.workflowStatus;
	data['LevelProgress'] = entity.levelProgress;
	data['RequestorId'] = entity.requestorId;
	data['RequestorName'] = entity.requestorName;
	data['ApproverId'] = entity.approverId;
	data['ApproverName'] = entity.approverName;
	data['SecondApproverId'] = entity.secondApproverId;
	data['SecondApproverName'] = entity.secondApproverName;
	data['CreatedBy'] = entity.createdBy;
	data['CreatorName'] = entity.creatorName;
	data['CreateDate'] = entity.createDate;
	data['CreateTime'] = entity.createTime;
	data['IsMyRequest'] = entity.isMyRequest;
	data['IsAdmin'] = entity.isAdmin;
	data['UpdatedName'] = entity.updatedName;
	data['AttachmentId'] = entity.attachmentId;
	data['RequestType'] = entity.requestType;
	return data;
}