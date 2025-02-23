import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:evaluation_project/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimens.padding,
      ),
      child: Row(
        children: [
          AppSvgViewer(
            path: Assets.icons.star,
            color: AppColors.complementaryColor,
            setDefaultColor: false,
            setDefaultWidthAndHeight: false,
            width: 11.0,
            height: 11.0,
          ),
          const AppHSpace(
            space: Dimens.smallPadding,
          ),
          Text(
            rate.toString(),
            style: AppTypography.dmSansTextTheme.labelMedium?.copyWith(
              color: AppColors.complementaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
