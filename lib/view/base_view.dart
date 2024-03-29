import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/widgets/no_connection.dart';
import 'package:kukelola_flutter/main.dart';

class BaseView extends StatefulWidget {

  BaseView({@required @required this.body, this.resizeAvoidBottomPadding = true});

  final Widget body;
  final bool resizeAvoidBottomPadding;

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(width: Get.width, height: Get.height,),
          Column(
            children: [
              Expanded(child: widget.body),
              Obx(() => NoConnection(height: commonController.notConnected.value ? 30.h : 0,)),
            ],
          ),
        ],
      ),
    );
  }
}
