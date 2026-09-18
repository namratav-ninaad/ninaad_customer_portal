import 'package:flutter/material.dart';
import 'package:ninaad_customer_portal/core/constants/app_images.dart';
import 'package:ninaad_customer_portal/core/constants/app_sizes.dart';
import 'package:ninaad_customer_portal/core/widgets/common_assets_image_widget.dart';

class CommonLogoImage extends StatelessWidget {
  const CommonLogoImage({
    super.key,
    this.imageHeight = AppSizes.image180,
    this.imageWidth = AppSizes.image280,
    this.imagePath,
    this.color,
  });

  final double imageHeight;
  final double imageWidth;
  final String? imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CommonAssetsImageWidget(
      imagePath: imagePath ?? AppImagesConstants.logoIcon,
      imageHeight: imageHeight,
      imageWidth: imageWidth,
      color: color,
    );
  }
}
