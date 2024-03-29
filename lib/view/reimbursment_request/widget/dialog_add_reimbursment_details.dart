import 'dart:async';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/view/reimbursment_request/reimbursment_request_controller.dart';

class DialogAddReimbursmentDetails extends StatefulWidget {

  DialogAddReimbursmentDetails({@required this.item, @required this.index});

  final ReimbursmentDetailItem item;
  final int index;

  @override
  _DialogAddReimbursmentDetailsState createState() => _DialogAddReimbursmentDetailsState();
}

class _DialogAddReimbursmentDetailsState extends State<DialogAddReimbursmentDetails> {
  String _formatNumber(String s) => NumberFormat.decimalPattern('en').format(int.parse(s));
  var _reimbursmentRequestCt = Get.put(ReimbursmentRequestController());
  var _descriptionFocus = FocusNode(), _costFocus = FocusNode();
  var _descriptionCt = TextEditingController(), _costCt = TextEditingController();
  StreamSubscription _keyboardStream;

  @override
  void initState() {
    super.initState();

    _keyboardStream = KeyboardVisibilityController().onChange.listen((bool visible) {
      if (!visible) FocusScope.of(context).requestFocus(FocusNode());
    });

    if (widget.item != null) {
      _descriptionCt.text = widget.item.description;
      _costCt.text = '${widget.item.cost}';
    }
  }

  @override
  void dispose() {
    _keyboardStream?.cancel();
    _descriptionCt.dispose();
    _costCt.dispose();

    super.dispose();
  }

  bool _disable() {
    if (_descriptionCt.text.trim() == '') return true;
    else if (_costCt.text.trim() == '') return true;
    else if (_costCt.text.trim().replaceAll('Rp ', '').replaceAll('.', '') == '0') return true;
    else return false;
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(widget.item == null ? 'Add Details' : 'Update Details', maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 18.ssp, decoration: TextDecoration.none),),
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
                textInputAction: null,
                focusNode: _descriptionFocus,
                hintText: 'type description...',
                controller: _descriptionCt,
                inputType: TextInputType.multiline,
                onEditingComplete: () {},
                onChanged: (_) => setState(() {}),
                onTap: () => setState(() => _descriptionFocus.requestFocus()),
                labelText: 'ITEM DESCRIPTION',
              ),
              SizedBox(height: 24.h,),
              CustomInput(
                textInputAction: TextInputAction.done,
                focusNode: _costFocus,
                controller: _costCt,
                hintText: '5,000',
                prefix: 'Rp ',
                inputType: TextInputType.number,
                onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                onChanged: (text) {
                  text = '${_formatNumber(text.replaceAll(',', ''))}';
                  _costCt.value = TextEditingValue(
                    text: text,
                    selection: TextSelection.collapsed(offset: text.length),
                  );
                  setState(() {});
                },
                onTap: () => setState(() => _costFocus.requestFocus()),
                labelText: 'ITEM COST',
              ),
              SizedBox(height: 24.h,),
              ButtonLoading(
                backgroundColor: ThemeColor.secondary,
                disable: _disable(),
                title: widget.item == null ? 'Add Details' : 'Update Details',
                loading: false,
                onTap: () {
                  if (widget.item == null) {
                    _reimbursmentRequestCt.addReimbursmentDetail(ReimbursmentDetailItem.standartConstructor(_descriptionCt.text.trim(), _costCt.text.trim().replaceAll(',', '')));
                  } else {
                    _reimbursmentRequestCt.updateReimbursmentDetail(widget.index, ReimbursmentDetailItem.standartConstructor(_descriptionCt.text.trim(), _costCt.text.trim().replaceAll(',', '')));
                  }

                  Get.back();
                },
                verticalPadding: 9.h,
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
