import 'package:kukelola_flutter/networking/model/Standart.dart';
import 'package:kukelola_flutter/networking/model/token.dart';
import 'package:kukelola_flutter/networking/model/user.dart';
import 'package:kukelola_flutter/networking/request/change_password_request.dart';
import 'package:kukelola_flutter/networking/service/base_service.dart';
import '../../main.dart';

class Service extends BaseService {
  
  Future<Token> token(String parameter) async {
    return await postUrlEncoded('${MyApp.BASE_API}token$parameter');
  }

  Future<User> account() async {
    return await get('${MyApp.BASE_API}api/User');
  }

  Future<Standart> changePassword(ChangePasswordRequest request) async {
    return await postFormData('${MyApp.BASE_API}api/User/ChangePassword', request.body());
  }

}