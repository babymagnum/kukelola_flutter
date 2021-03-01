import 'dart:async';

import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:kukelola_flutter/core/theme/theme_text_style.dart';
import 'package:kukelola_flutter/core/widgets/button_back.dart';
import 'package:kukelola_flutter/core/widgets/button_loading.dart';
import 'package:kukelola_flutter/view/online_attendance/online_attendance_controller.dart';

import '../base_view.dart';

class OnlineAttendanceView extends StatefulWidget {
  @override
  _OnlineAttendanceViewState createState() => _OnlineAttendanceViewState();
}

class _OnlineAttendanceViewState extends State<OnlineAttendanceView> {

  StreamSubscription<Position> _locationStream;
  var _onlineAttendanceCt = Get.put(OnlineAttendanceController());

  @override
  void dispose() {
    _locationStream?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _onlineAttendanceCt.listenClock();

    Future.delayed(Duration.zero, () async {
      await _determinePosition();

      _locationStream = Geolocator.getPositionStream().listen((Position position) {
        _onlineAttendanceCt.googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _onlineAttendanceCt.latLng.value, zoom: 15)));
        _onlineAttendanceCt.setLatLng(LatLng(position.latitude, position.longitude));
      });
    });
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Column(
        children: [
          SizedBox(height: context.mediaQueryPadding.top + 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: ButtonBack(
                    label: 'Online Attendance',
                    onBack: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Obx(() => Column(
                  children: [
                    SizedBox(height: 21.h,),
                    Text(_onlineAttendanceCt.clock.value, style: ThemeTextStyle.biryaniRegular.apply(color: Color(0xFF181921), fontSizeDelta: 14.ssp),),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoSwitch(value: _onlineAttendanceCt.isIn.value, activeColor: ThemeColor.primary, onChanged: (value) => _onlineAttendanceCt.setIsIn(value)),
                        SizedBox(width: 16.w,),
                        Text(_onlineAttendanceCt.isIn.value ? 'In' : 'Out', style: ThemeTextStyle.biryaniBold.apply(color: Color(0xFF181921), fontSizeDelta: 14.ssp),)
                      ],
                    ),
                    SizedBox(height: 24.h,),
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(target: _onlineAttendanceCt.latLng.value, zoom: 15),
                              onMapCreated: (GoogleMapController controller) {
                                _onlineAttendanceCt.setGoogleMapController(controller);
                              },
                              mapToolbarEnabled: false,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                            ),
                          ),
                          Positioned(
                            right: 7.w, bottom: 7.w,
                            child: Parent(
                              gesture: Gestures()..onTap(() async {
                                _onlineAttendanceCt.googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _onlineAttendanceCt.latLng.value, zoom: 15)));
                              }),
                              style: ParentStyle()..background.color(ThemeColor.secondary)
                                ..height(56.w)..width(56.w)..borderRadius(all: 1000),
                              child: Center(
                                child: SvgPicture.asset('assets/images/fa-solid_crosshairs.svg', width: 22.w, height: 22.w,),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h,),
                    ButtonLoading(
                      backgroundColor: ThemeColor.primary,
                      disable: _onlineAttendanceCt.loadingSubmit.value,
                      title: 'Submit',
                      loading: _onlineAttendanceCt.loadingSubmit.value,
                      onTap: () => _onlineAttendanceCt.submit(),
                      textStyle: ThemeTextStyle.biryaniBold.apply(color: Color(0xFFF9F7F7), fontSizeDelta: 14.ssp),
                    ),
                    SizedBox(height: 21.h,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
