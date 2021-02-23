import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/change_password/change_password_controller.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {

  var _changePasswordCt = Get.put(ChangePasswordController());
  var _currentPasswordFocus = FocusNode(), _newPasswordFocus = FocusNode(), _confirmPasswordFocus = FocusNode();

  Widget _passwordRequirements(String label) {
    return Text(label, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 12.ssp),);
  }

  bool _disable() {
    final form = _changePasswordCt.form.value;
    return form.currentPassword == '' || form.newPassword == '' || form.confirmPassword == '';
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Obx(() => Row(
                children: [
                  Expanded(
                    child: ButtonBack(
                      label: 'Change Password',
                      onBack: () => Get.back(),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  ButtonLoading(
                    backgroundColor: ThemeColor.primary,
                    disable: _changePasswordCt.loadingChangePassword.value || _disable(),
                    title: 'Save',
                    loading: _changePasswordCt.loadingChangePassword.value,
                    onTap: () => _changePasswordCt.changePassword(context),
                    verticalPadding: 6.h,
                    horizontalPadding: 22.w,
                    loadingSize: 12.w,
                    textStyle: ThemeTextStyle.biryaniSemiBold.apply(color: Colors.white, fontSizeDelta: 12.ssp),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Obx(() => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h,),
                      _passwordRequirements('Password must be:'),
                      SizedBox(height: 16.h,),
                      _passwordRequirements('- 8 characters or more.'),
                      _passwordRequirements('- Must contain lowercase character (a-z)'),
                      _passwordRequirements('- Must contain uppercase character (A-Z)'),
                      _passwordRequirements('- Must contain numeric character (0-9)'),
                      _passwordRequirements('- Optional: Can contain special character (!#)'),
                      SizedBox(height: 16.h,),
                      CustomInput(
                        isObsecure: _changePasswordCt.currentPasswordObsecure.value,
                        onObsecureClick: () => _changePasswordCt.setCurrentPasswordObsecure(!_changePasswordCt.currentPasswordObsecure.value),
                        textInputAction: TextInputAction.next,
                        focusNode: _currentPasswordFocus,
                        onChanged: (text) {
                          _changePasswordCt.form.value.currentPassword = text.trim();
                          _changePasswordCt.setForm(_changePasswordCt.form.value);
                          setState(() {});
                        },
                        hintText: 'type password...',
                        labelText: 'CURRENT PASSWORD',
                        inputType: TextInputType.name,
                        onEditingComplete: () => setState(() => FocusScope.of(context).requestFocus(_newPasswordFocus)),
                        onTap: () => setState(() => _currentPasswordFocus.requestFocus()),
                      ),
                      SizedBox(height: 24.h,),
                      CustomInput(
                        isObsecure: _changePasswordCt.newPasswordObsecure.value,
                        onObsecureClick: () => _changePasswordCt.setNewPasswordObsecure(!_changePasswordCt.newPasswordObsecure.value),
                        textInputAction: TextInputAction.next,
                        focusNode: _newPasswordFocus,
                        onChanged: (text) {
                          _changePasswordCt.form.value.newPassword = text.trim();
                          _changePasswordCt.setForm(_changePasswordCt.form.value);
                          setState(() {});
                        },
                        hintText: 'type password...',
                        labelText: 'NEW PASSWORD',
                        inputType: TextInputType.name,
                        onEditingComplete: () => setState(() => FocusScope.of(context).requestFocus(_confirmPasswordFocus)),
                        onTap: () => setState(() => _newPasswordFocus.requestFocus()),
                      ),
                      SizedBox(height: 24.h,),
                      CustomInput(
                        isObsecure: _changePasswordCt.confirmPasswordObsecure.value,
                        onObsecureClick: () => _changePasswordCt.setConfirmPasswordObsecure(!_changePasswordCt.confirmPasswordObsecure.value),
                        textInputAction: TextInputAction.done,
                        focusNode: _confirmPasswordFocus,
                        onChanged: (text) {
                          _changePasswordCt.form.value.confirmPassword = text.trim();
                          _changePasswordCt.setForm(_changePasswordCt.form.value);
                          setState(() {});
                        },
                        hintText: 'type password...',
                        labelText: 'CONFIRM PASSWORD',
                        inputType: TextInputType.name,
                        onEditingComplete: () => setState(() => FocusScope.of(context).requestFocus(FocusNode())),
                        onTap: () => setState(() => _confirmPasswordFocus.requestFocus()),
                      ),
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
