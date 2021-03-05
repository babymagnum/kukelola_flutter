import 'package:kukelola_flutter/generated/json/base/json_convert_content.dart';
import 'package:kukelola_flutter/generated/json/base/json_field.dart';

class Token with JsonConvert<Token> {
	@JSONField(name: "access_token")
	String accessToken;
	@JSONField(name: "token_type")
	String tokenType;
	@JSONField(name: "expires_in")
	int expiresIn;
	String error;
	@JSONField(name: "error_description")
	String errorDescription;
}
