import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class FileAttachment with JsonConvert<FileAttachment> {
	@JSONField(name: "Data")
	FileAttachmentData data;
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

class FileAttachmentData with JsonConvert<FileAttachmentData> {
	@JSONField(name: "FileName")
	String fileName;
	@JSONField(name: "ContentType")
	String contentType;
	@JSONField(name: "File")
	String file;
}
