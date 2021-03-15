import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class OvertimeSummaryGrid with JsonConvert<OvertimeSummaryGrid> {
	@JSONField(name: "Data")
	List<OvertimeSummaryGridData> data;
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

class OvertimeSummaryGridData with JsonConvert<OvertimeSummaryGridData> {
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
	String employeeName;
	@JSONField(name: "Nip")
	String nip;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "TotalHours")
	int totalHours;
	@JSONField(name: "ApprovalDate")
	String approvalDate;
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
