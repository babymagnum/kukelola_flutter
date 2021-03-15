import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class WorkflowGrid with JsonConvert<WorkflowGrid> {
	@JSONField(name: "Data")
	List<WorkflowGridData> data;
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

class WorkflowGridData with JsonConvert<WorkflowGridData> {
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
	bool loadingCancel = false;
	bool loadingApprove = false;
	bool loadingReject = false;
}
