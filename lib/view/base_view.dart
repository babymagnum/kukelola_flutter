import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/controller/common_controller.dart';
import 'package:kukelola_flutter/core/widgets/no_connection.dart';

class BaseView extends StatefulWidget {

  BaseView({@required @required this.body, this.resizeAvoidBottomPadding = true});

  final Widget body;
  final bool resizeAvoidBottomPadding;

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {

  var _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomPadding: widget.resizeAvoidBottomPadding,
      body: Stack(
        children: [
          Container(width: size.width, height: size.height,),
          Column(
            children: [
              Expanded(child: widget.body),
              Obx(() => NoConnection(height: _commonController.notConnected.value ? 30.h : 0,)),
            ],
          ),
        ],
      ),
    );
  }
}
