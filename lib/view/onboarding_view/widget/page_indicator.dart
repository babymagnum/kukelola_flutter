import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {

  PageIndicator({Key key, this.isFirst, this.isLast, this.isSelected}): super(key: key);

  final bool isFirst;
  final bool isLast;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(left: isFirst ? 0 : 5, right: isLast ? 0 : 5,),
      duration: Duration(milliseconds: 200),
      height: 10.w,
      width: 10.w,
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFF018CCA) : Color(0xFF9E9C9C),
          borderRadius: BorderRadius.all(Radius.circular(1000))
      ),
    );
  }
}