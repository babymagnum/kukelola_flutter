import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class ReimbursmentSummaryGrid with JsonConvert<ReimbursmentSummaryGrid> {
	@JSONField(name: "Data")
	List<ReimbursmentSummaryGridData> data;
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

class ReimbursmentSummaryGridData with JsonConvert<ReimbursmentSummaryGridData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "EmployeeName")
	String employeeName;
	@JSONField(name: "Nip")
	String nip;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "Total")
	double total;
	@JSONField(name: "ApprovalDate")
	String approvalDate;
	@JSONField(name: "CreatedDate")
	String createdDate;
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "ClientId")
	String clientId;
	@JSONField(name: "AttachmentId")
	dynamic attachmentId;
	@JSONField(name: "WorkflowId")
	String workflowId;
	@JSONField(name: "Attachment")
	dynamic attachment;
}
