import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/login/login_controller.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  var _emailFocus = FocusNode(), _passwordFocus = FocusNode();
  var _loginCt = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Container(
            color: Colors.black, height: MediaQuery.of(context).padding.top,
            width: Get.width,
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      children: [
                        SizedBox(height: 40.h),
                        ButtonBack(label: 'Sign In', onBack: () => exit(0),),
                        SizedBox(height: 28.h,),
                        SvgPicture.asset('assets/images/login.svg', width: Get.width * 0.6, height: Get.width * 0.6,),
                        SizedBox(height: 24.h,),
                        CustomInput(
                          textInputAction: TextInputAction.next,
                          focusNode: _emailFocus,
                          hintText: 'EMAIL',
                          labelText: 'email',
                          inputType: TextInputType.emailAddress,
                          onEditingComplete: () {
                            _passwordFocus.requestFocus();
                            FocusScope.of(context).requestFocus(_passwordFocus);
                            setState(() {});
                          },
                          onTap: () => setState(() => _emailFocus.requestFocus()),
                          hide: true,
                        ),
                        CustomInput(
                          isObsecure: _loginCt.obsecure.value,
                          onObsecureClick: () => _loginCt.setObsecure(!_loginCt.obsecure.value),
                          textInputAction: TextInputAction.done,
                          focusNode: _passwordFocus,
                          hintText: 'PASSWORD',
                          labelText: 'password',
                          inputType: TextInputType.name,
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          onTap: () => setState(() => _passwordFocus.requestFocus()),
                          hide: true,
                        ),
                        SizedBox(height: 40.h,),
                        ButtonLoading(
                          backgroundColor: ThemeColor.primary,
                          disable: false,
                          title: 'Sign In',
                          loading: false,
                          onTap: () => Get.to(VerificationCodeView()),
                          verticalPadding: 18.h,
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
