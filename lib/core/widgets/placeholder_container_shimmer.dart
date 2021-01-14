import 'package:kukelola_flutter/core/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderContainerShimmer extends StatelessWidget {

  PlaceholderContainerShimmer({Key key, this.size, this.borderRadius}): super (key: key);

  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ThemeColor.lightGrey3,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(borderRadius == null ? Radius.circular(size.height / 2) : Radius.circular(borderRadius)),
          color: ThemeColor.lightGrey3,
        ),
        height: size.height,
        width: size.width,
      ),
    );
  }
}
