import 'package:evaluation_project/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgViewer extends StatelessWidget {
  const AppSvgViewer({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.setDefaultColor = true,
    this.setDefaultWidthAndHeight = true,
    this.fit,
  });

  final String path; // Path to the SVG asset
  final double? width; // Optional width for the SVG
  final double? height; // Optional height for the SVG
  final Color? color; // Optional color for the SVG
  final bool setDefaultColor; // Whether to use a default color
  // Whether to use default width and height
  final bool setDefaultWidthAndHeight;
  final BoxFit? fit; // Optional BoxFit for the SVG

  @override
  Widget build(final BuildContext context) {
    return SvgPicture.asset(
      path, // Path to the SVG asset
      // Use provided width or default to 50 if setDefaultWidthAndHeight is true
      width: width ?? (setDefaultWidthAndHeight ? 30 : null),
      // Use provided height or default to 50 if setDefaultWidthAndHeight is true
      height: height ?? (setDefaultWidthAndHeight ? 30 : null),
      colorFilter: setDefaultColor
          ? const ColorFilter.mode(
              // Use the default icon color from the context
              AppColors.inactiveIconColor,
              BlendMode.srcIn, // Blend mode for applying the color
            )
          : color == null
              ? null // No color filter if no color is provided
              : ColorFilter.mode(
                  color!, // Use the provided color
                  BlendMode.srcIn, // Blend mode for applying the color
                ),
      fit: fit ?? BoxFit.contain,
    );
  }
}
