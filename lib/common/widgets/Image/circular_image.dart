import 'package:bodyandbeauty/loader/shimmer_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class MyCircularImage extends StatelessWidget {
  const MyCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = MSizes.sm,
    this.isNetworkImage = false,
  });
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
// If image background color is null then switch it to light and dark mode color design.
        color: backgroundColor ?? (MyHelperFunctions.isDarkMode (context)? MyColors.black: MyColors.white),
        borderRadius: BorderRadius.circular (100),
      ), // BoxDecoration
      child: Center(
        child: isNetworkImage
        ? CachedNetworkImage(
          fit: fit,
          color: overlayColor,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const MyShimmerEffect(width: 55, height: 55),
          errorWidget: (context, url, error) => const Icon (Icons.error)
        )
         : Image(
          fit: fit,
          image: AssetImage(image),
          color: overlayColor,
        ),
      ),
    );
  }
}