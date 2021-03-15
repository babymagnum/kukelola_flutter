import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class SpecialLeaveList with JsonConvert<SpecialLeaveList> {
	@JSONField(name: "Data")
	List<SpecialLeaveListData> data;
	@JSONField(name: "Total")
	int total;
	String errorMessage;
}

class SpecialLeaveListData with JsonConvert<SpecialLeaveListData> {
	@JSONField(name: "Id")
	String id;
	@JSONField(name: "Text")
	String text;
	@JSONField(name: "Data")
	dynamic data;
}
