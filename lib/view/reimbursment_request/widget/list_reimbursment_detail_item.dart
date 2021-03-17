import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/view/reimbursment_request/reimbursment_request_controller.dart';
import 'package:kukelola_flutter/view/reimbursment_request/widget/dialog_add_reimbursment_details.dart';

class ListReimbursmentDetailItem extends StatelessWidget {

  ListReimbursmentDetailItem({@required this.item, @required this.index});

  final ReimbursmentDetailItem item;
  final int index;

  var _reimbursmentRequestCt = Get.put(ReimbursmentRequestController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(item.description, textAlign: TextAlign.start, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
        ),
        Expanded(
          child: Text(TextUtil.toRupiah('.', int.parse(item.cost), false), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.end, style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: SvgPicture.asset('assets/images/fa-solid_edit.svg', width: 18.w, height: 16.h,),
                onTap: () => Get.dialog(DialogAddReimbursmentDetails(item: item, index: index,)),
              ),
              SizedBox(width: 10.w,),
              GestureDetector(
                child: SvgPicture.asset('assets/images/fa-solid_trash-alt.svg', width: 18.w, height: 16.h,),
                onTap: () => _reimbursmentRequestCt.removeReimbursmentDetail(index),
              ),
            ],
          ),
        )
      ],
    );
  }
}
