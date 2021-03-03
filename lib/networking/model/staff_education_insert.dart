import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class StaffEducationInsert with JsonConvert<StaffEducationInsert> {
	@JSONField(name: "Data")
	StaffEducationInsertData data;
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

class StaffEducationInsertData with JsonConvert<StaffEducationInsertData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Name")
	dynamic name;
	@JSONField(name: "Description")
	dynamic description;
	@JSONField(name: "EducationStep")
	String educationStep;
	@JSONField(name: "StartYear")
	int startYear;
	@JSONField(name: "EndYear")
	int endYear;
	@JSONField(name: "Institution")
	String institution;
	@JSONField(name: "Major")
	String major;
	@JSONField(name: "Score")
	String score;
	@JSONField(name: "StaffId")
	String staffId;
}
