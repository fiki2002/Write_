import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:io' as io;

import 'package:write/core/core.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageTypes,
    this.imageUrl,
    this.useIconColor = false,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
    this.color,
    this.loader,
    this.onTap,
  }) : super(key: key);

  final String? imageUrl;
  final ImageTypes imageTypes;
  final bool useIconColor;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? loader;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return GestureDetector(
        onTap: () {
          onTap;
        },
        child: Container(
          height: height,
          width: width,
          color: color ?? kSecondaryColor,
          child: Center(
            child: Icon(
              imageTypes == ImageTypes.profile
                  ? Icons.person
                  : Icons.broken_image_rounded,
            ),
          ),
        ),
      );
    }

    switch (imageTypes) {
      case ImageTypes.network:
        return Container(
          height: height,
          width: width,
          color: color,
          child: kIsWeb
              ? GestureDetector(
                  onTap: () {
                    onTap;
                  },
                  child: Image.network(
                    imageUrl!,
                    fit: fit,
                    errorBuilder: (_, __, ___) => Container(
                      color: kSecondaryColor,
                      child: const Center(
                        child: Icon(Icons.error_outline_rounded),
                      ),
                    ),
                    loadingBuilder: (_, __, ___) => const LoadingWidget(),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    onTap;
                  },
                  child: CachedNetworkImage(
                    imageUrl: '$imageUrl',
                    fit: fit,
                    fadeOutCurve: Curves.easeInCirc,
                    httpHeaders: const {'timeout': '30'},
                    errorWidget: (_, __, ___) => Container(
                      color: kSecondaryColor,
                      child: const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                    placeholder: (_, __) => loader ?? const LoadingWidget(),
                  ),
                ),
        );

      case ImageTypes.file:
        return GestureDetector(
          onTap: () {
            onTap;
          },
          child: SizedBox(
            height: height,
            width: width,
            child: Image.file(
              io.File(imageUrl!),
              fit: fit,
              color: color,
              errorBuilder: (_, __, ___) => Container(
                color: kSecondaryColor,
                child: const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
          ),
        );
      case ImageTypes.asset:
        return SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            imageUrl!,
            fit: fit,
            color: color,
            errorBuilder: (_, e, s) {
              AppLogger.log(e, s);
              return Container(
                color: kSecondaryColor,
                child: const Center(
                  child: Icon(Icons.error),
                ),
              );
            },
          ),
        );

      case ImageTypes.none:
        return SizedBox(
          height: height,
          width: width,
          child: const Placeholder(),
        );

      case ImageTypes.profile:
        return GestureDetector(
          onTap: () {
            onTap;
          },
          child: CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: imageUrl!,
            fit: fit,
            color: color,
            errorWidget: (_, __, ___) => Container(
              color: kSecondaryColor,
              child: const Center(child: Icon(Icons.person)),
            ),
            placeholder: (_, __) => const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        );
      case ImageTypes.svg:
        return GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imageUrl!,
              // ignore: deprecated_member_use
              color:
                  useIconColor ? (color ?? kSecondaryColor.withOpacity(0.6)) : null,
            ),
          ),
        );
    }
  }
}

/// Image types enums
enum ImageTypes { network, file, asset, profile, none, svg }
