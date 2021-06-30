import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/helper/text_util.dart';
import 'package:kukelola_flutter/core/widgets/dialog_error.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   if (TextUtil.getCurrentDate('dd-MM-yyyy') == '21-05-2021') {
    //     Get.dialog(DialogError(
    //       error: 'Aplikasi tidak bisa di akses!!',
    //       button: 'Mengerti',
    //       buttonClick: () => Get.back(),
    //     )).then((value) {
    //       SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    //     });
    //   }
    // });

  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(width: size.width, height: size.height,),
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
