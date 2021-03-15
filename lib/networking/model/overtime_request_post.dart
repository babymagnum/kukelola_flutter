import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class OvertimeRequestPost with JsonConvert<OvertimeRequestPost> {
	@JSONField(name: "Data")
	OvertimeRequestPostData data;
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

class OvertimeRequestPostData with JsonConvert<OvertimeRequestPostData> {
	@JSONField(name: "Request")
	OvertimeRequestPostDataRequest request;
	@JSONField(name: "Workflow")
	OvertimeRequestPostDataWorkflow workflow;
}

class OvertimeRequestPostDataRequest with JsonConvert<OvertimeRequestPostDataRequest> {
	@JSONField(name: "Data")
	OvertimeRequestPostDataRequestData data;
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
}

class OvertimeRequestPostDataRequestData with JsonConvert<OvertimeRequestPostDataRequestData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "OvertimeDate")
	String overtimeDate;
	@JSONField(name: "OvertimeDt")
	String overtimeDt;
	@JSONField(name: "StartHour")
	String startHour;
	@JSONField(name: "EndHour")
	String endHour;
	@JSONField(name: "EmployeeName")
	dynamic employeeName;
	@JSONField(name: "Nip")
	dynamic nip;
	@JSONField(name: "JobTitle")
	dynamic jobTitle;
	@JSONField(name: "TotalHours")
	int totalHours;
	@JSONField(name: "ApprovalDate")
	dynamic approvalDate;
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "ClientId")
	String clientId;
	@JSONField(name: "AttachmentId")
	String attachmentId;
	@JSONField(name: "WorkflowId")
	String workflowId;
	@JSONField(name: "Attachment")
	dynamic attachment;
}

class OvertimeRequestPostDataWorkflow with JsonConvert<OvertimeRequestPostDataWorkflow> {
	@JSONField(name: "Data")
	OvertimeRequestPostDataWorkflowData data;
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
}

class OvertimeRequestPostDataWorkflowData with JsonConvert<OvertimeRequestPostDataWorkflowData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "RejectReason")
	dynamic rejectReason;
	@JSONField(name: "WorkflowType")
	int workflowType;
	@JSONField(name: "WorkflowStatus")
	int workflowStatus;
	@JSONField(name: "LevelProgress")
	int levelProgress;
	@JSONField(name: "RequestorId")
	String requestorId;
	@JSONField(name: "RequestorName")
	String requestorName;
	@JSONField(name: "ApproverId")
	String approverId;
	@JSONField(name: "ApproverName")
	String approverName;
	@JSONField(name: "SecondApproverId")
	dynamic secondApproverId;
	@JSONField(name: "SecondApproverName")
	String secondApproverName;
	@JSONField(name: "CreatedBy")
	String createdBy;
	@JSONField(name: "CreatorName")
	dynamic creatorName;
	@JSONField(name: "CreateDate")
	String createDate;
	@JSONField(name: "CreateTime")
	String createTime;
	@JSONField(name: "IsMyRequest")
	bool isMyRequest;
	@JSONField(name: "IsAdmin")
	bool isAdmin;
	@JSONField(name: "UpdatedName")
	dynamic updatedName;
	@JSONField(name: "AttachmentId")
	String attachmentId;
	@JSONField(name: "RequestType")
	int requestType;
}
