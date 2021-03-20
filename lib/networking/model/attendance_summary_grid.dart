import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class AttendanceSummaryGrid with JsonConvert<AttendanceSummaryGrid> {
	@JSONField(name: "Data")
	AttendanceSummaryGridData data;
	@JSONField(name: "Total")
	int total;
	@JSONField(name: "Errors")
	List<dynamic> errors;
	@JSONField(name: "Message")
	String message;
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

class AttendanceSummaryGridData with JsonConvert<AttendanceSummaryGridData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Description")
	String description;
	@JSONField(name: "StartDate")
	String startDate;
	@JSONField(name: "EndDate")
	String endDate;
	@JSONField(name: "StartHour")
	String startHour;
	@JSONField(name: "EndHour")
	String endHour;
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
