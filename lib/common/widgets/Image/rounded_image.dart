import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class MyRoundedImage extends StatelessWidget {
  const MyRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.width ,
    this.height ,
    this.onPressed,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.isNetworkImage =false,
    this.borderRadius = MSizes.md,
    this.applyImageRadius = false,
    this.backgroundColor,

  });
  final BoxFit? fit;
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border,borderRadius: BorderRadius.circular(MSizes.md)),
        child: ClipRRect(
            borderRadius: applyImageRadius ? BorderRadius.circular(MSizes.md)  : BorderRadius.zero,
            child: Image(fit: fit,image: isNetworkImage ?  NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider)),
      ),
    );
  }
}