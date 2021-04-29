import 'dart:async';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/view/workflow_approval/controller/ongoing_request_controller.dart';

class DialogRejectApproval extends StatefulWidget {

  DialogRejectApproval({@required this.index});

  final int index;

  @override
  _DialogRejectApprovalState createState() => _DialogRejectApprovalState();
}

class _DialogRejectApprovalState extends State<DialogRejectApproval> {

  var _ongoingRequestCt = Get.find<OngoingRequestController>();
  var _reasonFocus = FocusNode();
  StreamSubscription _keyboardStream;

  @override
  void initState() {
    super.initState();

    _keyboardStream = KeyboardVisibilityController().onChange.listen((bool visible) {
      if (!visible) FocusScope.of(context).requestFocus(FocusNode());
    });
  }

  @override
  void dispose() {
    _keyboardStream?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      elevation: 0,
      content: Parent(
        style: ParentStyle()..borderRadius(all: 16)..background.color(Colors.white)
          ..maxHeight(Get.height - (Get.height * (0.05 * 2)))
          ..width(Get.width - (24.w * 2)),
        child: SingleChildScrollView(
          child: Obx(() => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('Reject Request', maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 18.ssp, decoration: TextDecoration.none),),
                    ),
                    SizedBox(width: 10.w,),
                    Parent(
                      gesture: Gestures()..onTap(() => Get.back()),
                      style: ParentStyle()..background.color(Color(0xFFED5565))..height(24.w)..width(24.w)..borderRadius(all: 4),
                      child: Center(
                        child: SvgPicture.asset('assets/images/fa-solid_times.svg', width: 11.w, height: 16.h,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h,),
                CustomInput(
                  textInputAction: TextInputAction.newline,
                  focusNode: _reasonFocus,
                  hintText: 'type reason...',
                  maxLines: null,
                  inputType: TextInputType.multiline,
                  onEditingComplete: () {},
                  onChanged: (text) => _ongoingRequestCt.setRejectReason(text.trim()),
                  onTap: () => setState(() => _reasonFocus.requestFocus()),
                  labelText: 'REASON',
                ),
                SizedBox(height: 24.h,),
                ButtonLoading(
                  backgroundColor: ThemeColor.secondary,
                  disable: _ongoingRequestCt.rejectReason.value == '' || _ongoingRequestCt.loadingReject.value,
                  title: 'Reject',
                  loading: _ongoingRequestCt.loadingReject.value,
                  onTap: () {
                    _ongoingRequestCt.rejectRequest(widget.index);
                    Get.back();
                  },
                  verticalPadding: 7.h,
                  textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
