import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class LeaveSummaryGrid with JsonConvert<LeaveSummaryGrid> {
	@JSONField(name: "Data")
	List<LeaveSummaryGridData> data;
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

class LeaveSummaryGridData with JsonConvert<LeaveSummaryGridData> {
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
	@JSONField(name: "LeaveType")
	String leaveType;
	@JSONField(name: "ApprovalDate")
	String approvalDate;
	@JSONField(name: "StartDt")
	String startDt;
	@JSONField(name: "StartDate")
	String startDate;
	@JSONField(name: "EndDate")
	String endDate;
	@JSONField(name: "JobTitle")
	String jobTitle;
	@JSONField(name: "TotalDays")
	int totalDays;
	@JSONField(name: "UserId")
	String userId;
	@JSONField(name: "SpecialLeaveId")
	dynamic specialLeaveId;
	@JSONField(name: "SpecialLeave")
	String specialLeave;
	@JSONField(name: "ClientId")
	String clientId;
	@JSONField(name: "AttachmentId")
	String attachmentId;
	@JSONField(name: "Attachment")
	dynamic attachment;
	bool loading = false;
}
