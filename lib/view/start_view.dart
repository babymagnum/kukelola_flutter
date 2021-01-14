import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:kukelola_flutter/view/home/home_view.dart';
import 'package:kukelola_flutter/view/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartView extends StatefulWidget {
  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      SharedPreferences.getInstance().then((preference) {
        final isLogin = preference?.getBool(Constant.IS_LOGIN) ?? false;

        Navigator.push(context, MaterialPageRoute(builder: (_) => !isLogin ? HomeView() : LoginView()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints.tight(Size(360, 640)), allowFontScaling: true);

    return Scaffold();
  }
}
