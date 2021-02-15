import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/constant.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/container_home/container_home_view.dart';
import 'package:kukelola_flutter/view/home/home_view.dart';
import 'package:kukelola_flutter/view/verification_code/verification_code_controller.dart';
import 'package:kukelola_flutter/view/verification_code/widget/input_verification_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationCodeView extends StatefulWidget {

  VerificationCodeView({Key key}): super(key: key);

  @override
  _VerificationCodeViewState createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {

  var _input1Focus = FocusNode(), _input2Focus = FocusNode(), _input3Focus = FocusNode(), _input4Focus = FocusNode();
  var _input1Controller = TextEditingController(), _input2Controller = TextEditingController(),
      _input3Controller = TextEditingController(), _input4Controller = TextEditingController();
  var _verificationCodeCt = Get.put(VerificationCodeController());

  bool _hasEmpty() {
    return _input1Controller.text.trim() == '' || _input2Controller.text.trim() == '' ||
        _input3Controller.text.trim() == '' || _input4Controller.text.trim() == '';
  }

  @override
  void dispose() {
    _input1Controller.dispose();
    _input2Controller.dispose();
    _input3Controller.dispose();
    _input4Controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _verificationCodeCt.startTimer();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return BaseView(
      body: Column(
        children: [
          Container(
            color: GetPlatform.isAndroid ? Colors.black : Colors.transparent, height: MediaQuery.of(context).padding.top,
            width: size.width,
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                    children: [
                      SizedBox(height: 24.h),
                      ButtonBack(label: 'Verification Code', onBack: () => Get.back(),),
                      SizedBox(height: 48.h,),
                      Text("Check your email inbox, we've sent you verification code. Please input the code below",
                        style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp), textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        '${_verificationCodeCt.minutes.toString().length == 1 ? '0${_verificationCodeCt.minutes}' : '${_verificationCodeCt.minutes}'}:'
                            '${_verificationCodeCt.seconds.toString().length == 1 ? '0${_verificationCodeCt.seconds}' : '${_verificationCodeCt.seconds}'}',
                        style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, color: Color(0xFFDE7250)),),
                      SizedBox(height: 16.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InputVerificationCode(
                            onChange: (value) {
                              if (value.trim().length > 0) {
                                setState(() => _input1Controller.text = value.length > 1 ? value[1] : value);
                                FocusScope.of(context).requestFocus(_input2Focus);
                              }
                            },
                            focusNode: _input1Focus,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(_input2Focus),
                            textEditingController: _input1Controller,
                          ),
                          InputVerificationCode(
                            onChange: (value) {
                              if (value.trim().length > 0) {
                                setState(() => _input2Controller.text = value.length > 1 ? value[1] : value);
                                FocusScope.of(context).requestFocus(_input3Focus);
                              }
                            },
                            focusNode: _input2Focus,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(_input3Focus),
                            textEditingController: _input2Controller,
                          ),
                          InputVerificationCode(
                            onChange: (value) {
                              if (value.trim().length > 0) {
                                setState(() => _input3Controller.text = value.length > 1 ? value[1] : value);
                                FocusScope.of(context).requestFocus(_input4Focus);
                              }
                            },
                            focusNode: _input3Focus,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(_input4Focus),
                            textEditingController: _input3Controller,
                          ),
                          InputVerificationCode(
                            onChange: (value) {
                              if (value.trim().length > 0) {
                                setState(() => _input4Controller.text = value.length > 1 ? value[1] : value);
                                FocusScope.of(context).requestFocus(FocusNode());
                              } else setState(() {});
                            },
                            focusNode: _input4Focus,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                            textInputAction: TextInputAction.done,
                            textEditingController: _input4Controller,
                          )
                        ],
                      ),
                      SizedBox(height: 24.h,),
                      Text('You have three chances to input verification code',
                        textAlign: TextAlign.center, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp),),
                      SizedBox(height: 16.h,),
                      _verificationCodeCt.timesUp.value ?
                      GestureDetector(
                        onTap: _verificationCodeCt.chances.value == 0 ? null : () => _verificationCodeCt.resendOtp(),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: Text('Retry sending verification code', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp, decoration: TextDecoration.underline, color: _verificationCodeCt.chances.value == 0 ? ThemeColor.disabled : Color(0xFF018CCA)),),
                        ),
                      ) :
                      _verificationCodeCt.loadingResendOtp.value ?
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: SizedBox(
                          width: 20.w, height: 20.w,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                          ),
                        ),
                      ) :
                      Container(),
                      ButtonLoading(
                        textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        backgroundColor: ThemeColor.primary,
                        disable: _hasEmpty() || _verificationCodeCt.loadingVerify.value,
                        title: 'Verify',
                        loading: _verificationCodeCt.loadingVerify.value,
                        onTap: () async {
                          await _verificationCodeCt.verifyOtp();

                          final preference = await SharedPreferences.getInstance();
                          await preference.setBool(Constant.IS_LOGIN, true);

                          Get.offAll(ContainerHomeView());
                        },
                        verticalPadding: 13.h,
                      ),
                      SizedBox(height: 24.h,)
                    ],
                  ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
