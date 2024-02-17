import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final String imageUrl;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.loadingWidget,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(12.0);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: ColorHelper.bold.withOpacity(0.6),
          width: 1,
        ),
      ),
      color: ColorHelper.white,
      type: MaterialType.card,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          imageUrl: imageUrl,
          placeholder: (context, url) =>
          loadingWidget ?? const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
        ),
      ),
    );
  }
}