import 'package:get/get.dart';

class LocalesString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'hello': 'Hello World',
    },
    'id': {
      'hello': 'Halo Dunia',
    }
  };
}