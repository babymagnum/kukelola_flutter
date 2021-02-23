import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';

class ListReimbursmentSummaryDetailItem extends StatelessWidget {

  ListReimbursmentSummaryDetailItem({@required this.item});

  final ReimbursmentDetailItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(item.description, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Text(TextUtil.toRupiah('.', int.parse(item.cost), false), style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
        ),
      ],
    );
  }
}
