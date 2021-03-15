import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class Notification with JsonConvert<Notification> {
	@JSONField(name: "Data")
	List<NotificationData> data;
	@JSONField(name: "Total")
	int total;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Message")
	dynamic message;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
	@JSONField(name: "IsAdmin")
	bool isAdmin;
	@JSONField(name: "IsSuperAdmin")
	bool isSuperAdmin;
	@JSONField(name: "IsFinance")
	bool isFinance;
	String errorMessage;
}

class NotificationData with JsonConvert<NotificationData> {
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "Take")
	int take;
	@JSONField(name: "Page")
	int page;
	@JSONField(name: "WorkflowDate")
	String workflowDate;
	@JSONField(name: "WorkflowType")
	int workflowType;
	@JSONField(name: "WorkflowTypeName")
	String workflowTypeName;
	@JSONField(name: "WorkflowStatus")
	int workflowStatus;
	@JSONField(name: "WorkflowStatusName")
	String workflowStatusName;
}
