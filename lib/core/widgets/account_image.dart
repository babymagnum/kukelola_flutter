import 'dart:convert';
import 'dart:io';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';

class AccountImage extends StatelessWidget {

  AccountImage({@required this.url, @required this.size, @required this.onError,
    @required this.error, @required this.boxFit, @required this.loadingSize,
    this.imageFile, @required this.loading, this.loadingColor = ThemeColor.primary});

  final String url;
  final Size size;
  final BoxFit boxFit;
  final File imageFile;
  final bool loading;
  final bool error;
  final Color loadingColor;
  final Size loadingSize;
  final Function onError;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..border(all: 2, color: Colors.white)..borderRadius(all: 1000)..width(size.width)..height(size.height),
      child: Center(
        child: loading ?
        SizedBox(
          width: 20.w, height: 20.w,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
          ),
        ) :
        error ?
        GestureDetector(
          onTap: onError,
          child: Icon(Icons.refresh, size: size.width,),
        ) :
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          child: imageFile != null ?
          Image.file(imageFile, width: size.width - 2, height: size.height - 2, fit: boxFit,) :
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(1000)),
            child: Image.memory(base64.decode(url), width: size.width - 2, height: size.height - 2, fit: boxFit,),
          ),
        ),
      ),
    );
  }
}
