import 'package:kukelola_flutter/networking/model/workflow_grid.dart';

workflowGridFromJson(WorkflowGrid data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<WorkflowGridData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new WorkflowGridData().fromJson(v));
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
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> workflowGridToJson(WorkflowGrid entity) {
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
	data['errorMessage'] = entity.errorMessage;
	return data;
}

workflowGridDataFromJson(WorkflowGridData data, Map<String, dynamic> json) {
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
	if (json['loadingCancel'] != null) {
		data.loadingCancel = json['loadingCancel'];
	}
	if (json['loadingApprove'] != null) {
		data.loadingApprove = json['loadingApprove'];
	}
	if (json['loadingReject'] != null) {
		data.loadingReject = json['loadingReject'];
	}
	return data;
}

Map<String, dynamic> workflowGridDataToJson(WorkflowGridData entity) {
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
	data['loadingCancel'] = entity.loadingCancel;
	data['loadingApprove'] = entity.loadingApprove;
	data['loadingReject'] = entity.loadingReject;
	return data;
}