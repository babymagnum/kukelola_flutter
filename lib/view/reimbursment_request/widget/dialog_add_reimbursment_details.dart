import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/view/reimbursment_request/reimbursment_request_controller.dart';

class DialogAddReimbursmentDetails extends StatefulWidget {

  DialogAddReimbursmentDetails({@required this.item});

  final ReimbursmentDetailItem item;

  @override
  _DialogAddReimbursmentDetailsState createState() => _DialogAddReimbursmentDetailsState();
}

class _DialogAddReimbursmentDetailsState extends State<DialogAddReimbursmentDetails> {

  var _reimbursmentRequestCt = Get.put(ReimbursmentRequestController());
  var _descriptionFocus = FocusNode(), _costFocus = FocusNode();
  var _descriptionCt = TextEditingController(), _costCt = MoneyMaskedTextController(initialValue: 0, decimalSeparator: '', thousandSeparator: '.', precision: 0, leftSymbol: 'Rp ');

  @override
  void initState() {
    super.initState();

    if (widget.item != null) {
      _descriptionCt.text = widget.item.description;
      _costCt.text = '${widget.item.price}';
    }
  }

  @override
  void dispose() {
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
                    child: Text('Add Details', maxLines: 2, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniBold.apply(fontSizeDelta: 18.ssp, decoration: TextDecoration.none),),
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
                hintText: 'type cost...',
                inputType: TextInputType.number,
                onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                onChanged: (_) => setState(() {}),
                onTap: () => setState(() => _costFocus.requestFocus()),
                labelText: 'ITEM COST',
              ),
              SizedBox(height: 24.h,),
              ButtonLoading(
                backgroundColor: ThemeColor.secondary,
                disable: _disable(),
                title: 'Add Details',
                loading: false,
                onTap: () {
                  _reimbursmentRequestCt.addReimbursmentDetail(ReimbursmentDetailItem(_descriptionCt.text.trim(), int.parse(_costCt.text.trim().replaceAll('Rp', '').replaceAll('.', ''))));
                  Get.back();
                },
                verticalPadding: 12.h,
                textStyle: ThemeTextStyle.biryaniBold.apply(color: Colors.white, fontSizeDelta: 14.ssp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
