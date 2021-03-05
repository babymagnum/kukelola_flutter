import 'package:kukelola_flutter/networking/model/token.dart';

tokenFromJson(Token data, Map<String, dynamic> json) {
	if (json['access_token'] != null) {
		data.accessToken = json['access_token'].toString();
	}
	if (json['token_type'] != null) {
		data.tokenType = json['token_type'].toString();
	}
	if (json['expires_in'] != null) {
		data.expiresIn = json['expires_in'] is String
				? int.tryParse(json['expires_in'])
				: json['expires_in'].toInt();
	}
	if (json['error'] != null) {
		data.error = json['error'].toString();
	}
	if (json['error_description'] != null) {
		data.errorDescription = json['error_description'].toString();
	}
	return data;
}

Map<String, dynamic> tokenToJson(Token entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['access_token'] = entity.accessToken;
	data['token_type'] = entity.tokenType;
	data['expires_in'] = entity.expiresIn;
	data['error'] = entity.error;
	data['error_description'] = entity.errorDescription;
	return data;
}