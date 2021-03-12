import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/custom_input.dart';
import 'package:kukelola_flutter/main.dart';

class BusinessTripDetailInput extends StatefulWidget {
  final String title;
  final Function(String text) onAmountChange;
  final Function(String text) onDescriptionChange;

  BusinessTripDetailInput({@required this.title, @required this.onAmountChange, @required this.onDescriptionChange});

  @override
  _BusinessTripDetailInputState createState() => _BusinessTripDetailInputState();
}

class _BusinessTripDetailInputState extends State<BusinessTripDetailInput> {
  String _formatNumber(String s) => NumberFormat.decimalPattern(commonController.language.value).format(int.parse(s));
  var _amountCt = TextEditingController();
  // String get _currency => NumberFormat.compactSimpleCurrency(locale: commonController.language.value).currencySymbol;
  var _amountFocus = FocusNode(), _descriptionFocus = FocusNode();

  @override
  void dispose() {
    _amountCt.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniSemiBold.apply(color: Color(0xFF158AC9), fontSizeDelta: 12.ssp),),
            ),
            SizedBox(width: 10.w,),
            SvgPicture.asset('assets/images/arrow_down.svg', width: 10.w, height: 5.h,)
          ],
        ),
        SizedBox(height: 6.h,),
        CustomInput(
          textInputAction: TextInputAction.done,
          focusNode: _amountFocus,
          controller: _amountCt,
          prefix: 'Rp ',
          hintText: '5,000',
          inputType: TextInputType.number,
          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
          // onChanged: (_) => widget.onAmountChange(_.replaceAll('Rp', '').replaceAll('.', '')),
          onChanged: (text) {
            text = '${_formatNumber(text.replaceAll(',', ''))}';
            _amountCt.value = TextEditingValue(
              text: text,
              selection: TextSelection.collapsed(offset: text.length),
            );

            widget.onAmountChange(_amountCt.text.trim().replaceAll(',', ''));
          },
          onTap: () => setState(() => _amountFocus.requestFocus()),
          labelText: 'AMOUNT',
        ),
        SizedBox(height: 16.h,),
        CustomInput(
          textInputAction: null,
          focusNode: _descriptionFocus,
          labelText: 'DESCRIPTION',
          hintText: 'type description...',
          inputType: TextInputType.multiline,
          onEditingComplete: () {},
          maxLines: null,
          onChanged: (_) => widget.onDescriptionChange(_),
          onTap: () => setState(() => _descriptionFocus.requestFocus()),
        ),
      ],
    );
  }
}
