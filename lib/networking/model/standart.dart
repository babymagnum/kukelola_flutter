import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class Standart with JsonConvert<Standart> {
	@JSONField(name: "Message")
	String message;
	@JSONField(name: "IsSuccess")
	bool isSuccess;
}
