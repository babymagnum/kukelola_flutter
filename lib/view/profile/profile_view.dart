import 'dart:convert';
import 'dart:io';
import 'package:division/division.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/account_image.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_reload.dart';
import 'package:kukelola_flutter/main.dart';
import 'package:kukelola_flutter/view/container_home/container_home_controller.dart';
import 'package:kukelola_flutter/view/profile/profile_controller.dart';
import 'package:kukelola_flutter/view/profile/widget/list_profile_menu_item.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with AutomaticKeepAliveClientMixin<ProfileView> {

  var _profileCt = Get.put(ProfileController());
  var _containerHomeCt = Get.find<ContainerHomeController>();

  _ubahFotoProfil() async {
    _profileCt.setLoadingProfileFoto(true);
    FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    ).then((value) async {
      _profileCt.setProfileFoto(File(value.files.single.path));
    }, onError: (error) => _profileCt.setLoadingProfileFoto(false))
        .whenComplete(() => _profileCt.setLoadingProfileFoto(false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.mediaQueryPadding.top + 24.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ButtonBack(label: 'Profile', onBack: () {
            _containerHomeCt.pageController.jumpToPage(0);
            _containerHomeCt.setSelectedPage(0);
          }),
        ),
        Expanded(
          child: Obx(() => homeController.loadingUser.value ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w, height: 20.w,
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),),
                )
              ],
            ) :
            homeController.errorUser.value ?
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    ButtonReload(onTap: () => homeController.getUser()),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ) :
            CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 14.h,),
                    Parent(
                      style: ParentStyle()..borderRadius(all: 1000)..width(64.w)..height(64.w),
                      child: Obx(() => Stack(
                        children: [
                          AccountImage(
                            url: homeController.profilePicture.value,
                            size: Size(64.w, 64.w),
                            errorSize: 32.w,
                            imageNull: homeController.userData.value.profilePictureId == null,
                            onError: () => homeController.getProfilePicture(),
                            error: homeController.errorProfilePicture.value,
                            boxFit: BoxFit.contain,
                            loading: homeController.loadingProfilePicture.value,
                            loadingSize: Size(16.w, 16.w),
                          ),
                          Positioned(
                            bottom: 2, left: 2, right: 2,
                            child: Parent(
                              gesture: Gestures()..onTap(() => _ubahFotoProfil()),
                              style: ParentStyle()..borderRadius(bottomRight: 1000, bottomLeft: 1000)..width(64.w)..height(32.w)..background.color(Colors.black.withOpacity(0.35))
                                ..ripple(true),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt, size: 18.w, color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                          _profileCt.loadingProfileFoto.value ?
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(height: 20.w, width: 20.w, child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                            )),
                          ) :
                          Container()
                        ],
                      ),
                      ),
                    ),
                    SizedBox(height: 14.h,),
                    Text(homeController?.userData?.value?.fullName ?? '-', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 20.ssp),),
                    SizedBox(height: 2.h,),
                    Text(homeController?.userData?.value?.jobTitle ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 12.ssp),),
                    SizedBox(height: 2.h,),
                    Text(homeController?.userData?.value?.clientName ?? '-', style: ThemeTextStyle.biryaniSemiBold.apply(fontSizeDelta: 11.ssp),),
                    SizedBox(height: 18.h,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NIP', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                            SizedBox(height: 5.h,),
                            Text(homeController?.userData?.value?.nip ?? '-', style: ThemeTextStyle.biryaniRegular.apply(fontSizeDelta: 14.ssp),),
                            SizedBox(height: 12.h,),
                            Text('OPTIONS', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFC4C4C4), fontSizeDelta: 10.ssp),),
                            ListView.separated(
                              padding: EdgeInsets.only(top: 16.h, bottom: 24.w),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (_, index) => ListProfileMenuItem(
                                item: _profileCt.listProfileMenu[index], index: index, context: context,
                              ),
                              separatorBuilder: (_, __) => Divider(color: Colors.transparent, height: 20.h,),
                              itemCount: _profileCt.listProfileMenu.length,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override bool get wantKeepAlive => true;
}
