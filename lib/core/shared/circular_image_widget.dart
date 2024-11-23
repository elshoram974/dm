import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/app_assets.dart';

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.assetPlaceHolder,
  });
  final String? imageUrl;
  final double radius;
  final String? assetPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: radius,
        width: radius,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white70,
          // image: DecorationImage(
          //   image: AssetImage(assetPlaceHolder ?? AppAssets.personPlaceholder),
          // ),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          height: radius,
          width: radius,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) {
            if (imageUrl == null) {
              return Image.asset(
                assetPlaceHolder ?? AppAssets.placeholder,
                fit: BoxFit.cover,
              );
            }
            return Icon(
              Icons.error_outline,
              color: context.theme.colorScheme.error,
            );
          },
        ),
      ),
    );
  }
}
