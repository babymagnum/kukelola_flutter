import 'dart:async';
import 'dart:io';
import 'package:division/division.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/core/widgets/empty_text.dart';
import 'package:kukelola_flutter/core/widgets/input_attachment.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/reimbursment_request/widget/dialog_add_reimbursment_details.dart';
import 'package:kukelola_flutter/view/reimbursment_request/reimbursment_request_controller.dart';
import 'package:kukelola_flutter/view/reimbursment_request/widget/list_reimbursment_detail_item.dart';

class ReimbursmentRequestView extends StatefulWidget {
  @override
  _ReimbursmentRequestViewState createState() => _ReimbursmentRequestViewState();
}

class _ReimbursmentRequestViewState extends State<ReimbursmentRequestView> {

  var _reimbursmentRequestCt = Get.put(ReimbursmentRequestController());
  var _descriptionFocus = FocusNode();
  var _descriptionCt = TextEditingController();
  StreamSubscription _keyboardStream;

  Widget _textTitleDetails(String label, int flex) {
    return Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),));
  }

  _pickFile() async {
    _reimbursmentRequestCt.setLoadingAttachment(true);
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png', 'jpeg', 'JPG'],);
    _reimbursmentRequestCt.setLoadingAttachment(false);

    if(result != null) {
      File file = File(result.files.single.path);
      _reimbursmentRequestCt.form.value.attachment = file;
      _reimbursmentRequestCt.updateForm(_reimbursmentRequestCt.form.value);
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: 'Canceled the picker.', backgroundColor: Colors.black.withOpacity(0.6));
    }
  }

  bool _disable() {
    var form = _reimbursmentRequestCt.form.value;
    return form.reason == '' || form.listDetails.length == 0 || form.attachment.path == '';
  }

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
    _descriptionCt.dispose();

    super.dispose();
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
                    label: 'Reimbursment Request',
                    onBack: () => Get.back(),
                  ),
                ),
                SizedBox(width: 10.w,),
                ButtonLoading(
                  backgroundColor: ThemeColor.primary,
                  disable: _reimbursmentRequestCt.loadingSubmit.value || _disable(),
                  title: 'Submit',
                  loading: _reimbursmentRequestCt.loadingSubmit.value,
                  onTap: () => _reimbursmentRequestCt.submitReimbursment(),
                  verticalPadding: 5.h,
                  horizontalPadding: 15.w,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.h,),
                        CustomInput(
                          textInputAction: null,
                          focusNode: _descriptionFocus,
                          hintText: 'type description...',
                          maxLines: null,
                          inputType: TextInputType.multiline,
                          onEditingComplete: () {},
                          onChanged: (text) {
                            _reimbursmentRequestCt.form.value.reason = text;
                            _reimbursmentRequestCt.updateForm(_reimbursmentRequestCt.form.value);
                            setState(() {});
                          },
                          onTap: () => setState(() => _descriptionFocus.requestFocus()),
                          labelText: 'DESCRIPTION',
                        ),
                        SizedBox(height: 24.h,),
                        ButtonLoading(
                          backgroundColor: ThemeColor.secondary,
                          disable: false,
                          title: 'Add Details',
                          loading: false,
                          onTap: () => Get.dialog(DialogAddReimbursmentDetails(item: null,)),
                          verticalPadding: 9.h,
                          textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
                        ),
                        SizedBox(height: 24.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _textTitleDetails('ITEM DESCRIPTION', 2),
                            _textTitleDetails('ITEM COST', 1),
                            _textTitleDetails('ACTION', 1),
                          ],
                        ),
                        SizedBox(height: 8.h,),
                        Parent(style: ParentStyle()..background.color(Color(0xFFC4C4C4))..height(1)..width(Get.width),),
                        _reimbursmentRequestCt.form.value.listDetails.length == 0 ?
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: EmptyText(text: 'Reimbursment Detail is empty, tap the button to add.', textSize: 14.ssp),
                        ) :
                        ListView.separated(
                          padding: EdgeInsets.only(top: 16.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => ListReimbursmentDetailItem(item: _reimbursmentRequestCt.form.value.listDetails[index], index: index,),
                          separatorBuilder: (_, __) => Divider(height: 10.h, color: Colors.transparent,),
                          itemCount: _reimbursmentRequestCt.form.value.listDetails.length,
                        ),
                        SizedBox(height: 24.h,),
                        InputAttachment(
                          labelText: 'ATTACHMENT (OPTIONAL)',
                          hintText: 'choose file...',
                          onTap: () => _pickFile(),
                          loading: _reimbursmentRequestCt.loadingAttachment.value,
                          value: _reimbursmentRequestCt.form.value.attachment.path == '' ? '' : '${_reimbursmentRequestCt.form.value.attachment.path} (${(_reimbursmentRequestCt.form.value.attachment.lengthSync() / 1024).round()} KB)',
                        )
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
