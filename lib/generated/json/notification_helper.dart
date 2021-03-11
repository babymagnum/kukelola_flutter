import 'package:kukelola_flutter/networking/model/notification.dart';

notificationFromJson(Notification data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<NotificationData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new NotificationData().fromJson(v));
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

Map<String, dynamic> notificationToJson(Notification entity) {
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

notificationDataFromJson(NotificationData data, Map<String, dynamic> json) {
	if (json['UserId'] != null) {
		data.userId = json['UserId'].toString();
	}
	if (json['Take'] != null) {
		data.take = json['Take'] is String
				? int.tryParse(json['Take'])
				: json['Take'].toInt();
	}
	if (json['Page'] != null) {
		data.page = json['Page'] is String
				? int.tryParse(json['Page'])
				: json['Page'].toInt();
	}
	if (json['WorkflowDate'] != null) {
		data.workflowDate = json['WorkflowDate'].toString();
	}
	if (json['WorkflowType'] != null) {
		data.workflowType = json['WorkflowType'] is String
				? int.tryParse(json['WorkflowType'])
				: json['WorkflowType'].toInt();
	}
	if (json['WorkflowTypeName'] != null) {
		data.workflowTypeName = json['WorkflowTypeName'].toString();
	}
	if (json['WorkflowStatus'] != null) {
		data.workflowStatus = json['WorkflowStatus'] is String
				? int.tryParse(json['WorkflowStatus'])
				: json['WorkflowStatus'].toInt();
	}
	if (json['WorkflowStatusName'] != null) {
		data.workflowStatusName = json['WorkflowStatusName'].toString();
	}
	return data;
}

Map<String, dynamic> notificationDataToJson(NotificationData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['UserId'] = entity.userId;
	data['Take'] = entity.take;
	data['Page'] = entity.page;
	data['WorkflowDate'] = entity.workflowDate;
	data['WorkflowType'] = entity.workflowType;
	data['WorkflowTypeName'] = entity.workflowTypeName;
	data['WorkflowStatus'] = entity.workflowStatus;
	data['WorkflowStatusName'] = entity.workflowStatusName;
	return data;
}