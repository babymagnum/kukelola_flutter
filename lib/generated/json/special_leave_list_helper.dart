import 'package:kukelola_flutter/networking/model/special_leave_list.dart';

specialLeaveListFromJson(SpecialLeaveList data, Map<String, dynamic> json) {
	if (json['Data'] != null) {
		data.data = new List<SpecialLeaveListData>();
		(json['Data'] as List).forEach((v) {
			data.data.add(new SpecialLeaveListData().fromJson(v));
		});
	}
	if (json['Total'] != null) {
		data.total = json['Total'] is String
				? int.tryParse(json['Total'])
				: json['Total'].toInt();
	}
	if (json['errorMessage'] != null) {
		data.errorMessage = json['errorMessage'].toString();
	}
	return data;
}

Map<String, dynamic> specialLeaveListToJson(SpecialLeaveList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['Data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['Total'] = entity.total;
	data['errorMessage'] = entity.errorMessage;
	return data;
}

specialLeaveListDataFromJson(SpecialLeaveListData data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id'].toString();
	}
	if (json['Text'] != null) {
		data.text = json['Text'].toString();
	}
	if (json['Data'] != null) {
		data.data = json['Data'];
	}
	return data;
}

Map<String, dynamic> specialLeaveListDataToJson(SpecialLeaveListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Text'] = entity.text;
	data['Data'] = entity.data;
	return data;
}