import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/model/static_model.dart';
import 'package:kukelola_flutter/view/base_view.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/container_home/widget/container_home_menu.dart';
import 'package:kukelola_flutter/view/home/home_view.dart';
import 'package:kukelola_flutter/view/notification/notification_view.dart';
import 'package:kukelola_flutter/view/profile/profile_view.dart';
import 'package:kukelola_flutter/view/summary/summary_view.dart';

class ContainerHomeView extends StatefulWidget {
  @override
  _ContainerHomeViewState createState() => _ContainerHomeViewState();
}

class _ContainerHomeViewState extends State<ContainerHomeView> {

  var _pageCt = PageController(initialPage: 0);
  var _containerHomeCt = Get.put(ContainerHomeController());

  @override
  void dispose() {
    _pageCt.dispose();

    super.dispose();
  }

  _changePage(int index) {
    _containerHomeCt.setSelectedPage(index);
    _pageCt.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageCt,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeView(),
                NotificationView(),
                SummaryView(),
                ProfileView()
              ],
            ),
          ),
          Parent(
            style: ParentStyle()..width(Get.width)..background.color(Colors.white)
              ..boxShadow(color: Colors.black.withOpacity(0.05), blur: 6, spread: 0, offset: Offset(0, -2)),
            child: Row(
              children: [
                ContainerHomeMenu(index: 0, item: ContainerHomeItem('Home', 'assets/images/fa-solid_home.svg'), onClick: () => _changePage(0),),
                ContainerHomeMenu(index: 1, item: ContainerHomeItem('Notification', 'assets/images/fa-solid_bell.svg'), onClick: () => _changePage(1),),
                ContainerHomeMenu(index: 2, item: ContainerHomeItem('Summary', 'assets/images/fa-solid_clipboard-check.svg'), onClick: () => _changePage(2),),
                ContainerHomeMenu(index: 3, item: ContainerHomeItem('Profile', 'assets/images/fa-solid_user.svg'), onClick: () => _changePage(3),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
