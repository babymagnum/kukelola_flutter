import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/summary/summary_controller.dart';
import 'package:kukelola_flutter/view/summary/widget/list_summary_menu_item.dart';

class SummaryView extends StatefulWidget {
  @override
  _SummaryViewState createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> with AutomaticKeepAliveClientMixin<SummaryView> {

  var _summaryCt = Get.put(SummaryController());
  var _containerHomeCt = Get.find<ContainerHomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.mediaQueryPadding.top + 24.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              Expanded(
                child: ButtonBack(label: 'Summary', onBack: () {
                  _containerHomeCt.pageController.jumpToPage(0);
                  _containerHomeCt.setSelectedPage(0);
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: StaggeredGridView.countBuilder(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: _summaryCt.listMenu.length,
            itemBuilder: (_, index) => ListSummaryMenuItem(item: _summaryCt.listMenu[index], index: index,),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 16.w,
            crossAxisSpacing: 16.w,
          ),
        )
      ],
    );
  }

  @override bool get wantKeepAlive => true;
}
