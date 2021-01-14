import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNetworkImage extends StatelessWidget {

  ShimmerNetworkImage({Key key, this.errorImage, @required this.url, @required this.size,
    @required this.borderRadius, @required this.boxFit, this.onlyTopLeftRight = false}): super (key: key);

  final String url;
  final Size size;
  final double borderRadius;
  final BoxFit boxFit;
  final String errorImage;
  final bool onlyTopLeftRight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: onlyTopLeftRight ? BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius)) : BorderRadius.all(Radius.circular(borderRadius)),
      child: CachedNetworkImage(
        imageBuilder: (context, imageProvider) => Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
            ),
          ),
        ),
        imageUrl: url,
        errorWidget: (context, _, __) => SvgPicture.asset(
          errorImage == null ? 'assets/images/profile.svg' : errorImage,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        placeholder: (context, _) => Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: ThemeColor.lightGrey3,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: Container(
              height: size.height, width: size.width,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
