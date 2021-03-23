import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/login/login_controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var _emailFocus = FocusNode(), _passwordFocus = FocusNode();
  var _emailCt = TextEditingController(), _passwordCt = TextEditingController();
  var _loginCt = Get.put(LoginController());

  @override
  void initState() {
    super.initState();

    if (commonController.autoLogin.value) {
      if ((commonController?.preferences?.getString(Constant.EMAIL) ?? '') != '') {
        _loginCt.form.value.username = commonController?.preferences?.getString(Constant.EMAIL) ?? '';
        _loginCt.form.value.password = commonController?.preferences?.getString(Constant.PASSWORD) ?? '';
        _loginCt.setForm(_loginCt.form.value);
      }

      _emailCt.text = _loginCt.form.value.username;
      _passwordCt.text = _loginCt.form.value.password;
      setState(() {});
      _loginCt.login(false);
    }
  }

  @override
  void dispose() {
    _emailCt.dispose();
    _passwordCt.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Container(
            color: GetPlatform.isAndroid ? Colors.black : Colors.transparent, height: MediaQuery.of(context).padding.top,
            width: Get.width,
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      children: [
                        SizedBox(height: 24.h),
                        ButtonBack(label: 'Sign In', onBack: () => exit(0),),
                        SizedBox(height: 28.h,),
                        SvgPicture.asset('assets/images/login.svg', width: Get.width * 0.6, height: Get.width * 0.6,),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          hintText: 'type email...',
                          labelText: 'EMAIL',
                          controller: _emailCt,
                          inputType: TextInputType.emailAddress,
                          onEditingComplete: () {
                            _passwordFocus.requestFocus();
                            FocusScope.of(context).requestFocus(_passwordFocus);
                            setState(() {});
                          },
                          onChanged: (text) {
                            _loginCt.form.value.username = text.trim();
                            _loginCt.setForm(_loginCt.form.value);
                          },
                          onTap: () => setState(() => _emailFocus.requestFocus()),
                        ),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          isObsecure: _loginCt.obsecure.value,
                          onObsecureClick: () => _loginCt.setObsecure(!_loginCt.obsecure.value),
                          textInputAction: TextInputAction.done,
                          focusNode: _passwordFocus,
                          controller: _passwordCt,
                          hintText: 'type password...',
                          labelText: 'PASSWORD',
                          onChanged: (text) {
                            _loginCt.form.value.password = text.trim();
                            _loginCt.setForm(_loginCt.form.value);
                            setState(() {});
                          },
                          inputType: TextInputType.emailAddress,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _passwordFocus.requestFocus()),
                        ),
                        SizedBox(height: 40.h,),
                        ButtonLoading(
                          backgroundColor: ThemeColor.primary,
                          disable: _loginCt.loadingLogin.value || _loginCt.form.value.username == '' || _loginCt.form.value.password == '',
                          title: 'Sign In',
                          loading: _loginCt.loadingLogin.value,
                          onTap: () => _loginCt.login(false),
                          verticalPadding: 10.h,
                          textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
