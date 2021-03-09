import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';

class AccountImage extends StatelessWidget {

  AccountImage({Key key, @required this.url, @required this.size, @required this.boxFit, this.imageFile}): super (key: key);

  final String url;
  final Size size;
  final BoxFit boxFit;
  final File imageFile;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..border(all: 2, color: Colors.white)..borderRadius(all: 1000)..width(size.width)..height(size.height),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        child: imageFile != null ?
        Image.file(imageFile, width: size.width - 2, height: size.height - 2, fit: boxFit,) :
        CachedNetworkImage(
          imageBuilder: (context, imageProvider) => Container(
            height: size.height - 2,
            width: size.width - 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit
              ),
            ),
          ),
          imageUrl: url,
          errorWidget: (context, _, __) => SvgPicture.asset(
            'assets/images/fa-solid_user.svg',
            width: size.width - 2,
            height: size.height - 2,
            fit: BoxFit.contain,
          ),
          placeholder: (context, _) => Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: ThemeColor.lightGrey3,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(1000)),
              child: Container(
                height: size.height, width: size.width,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
