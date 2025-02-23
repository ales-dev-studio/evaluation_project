import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          Assets.images.logo.path,
          color: AppColors.whiteColor,
          width: 186.0,
          height: 93.0,
        ),
        const AppVSpace(
          space: Dimens.smallPadding,
        ),
        Text(
          'LOOKY',
          style: AppTypography.dmSansTextTheme.displayLarge?.copyWith(
            color: AppColors.whiteColor,
            height: 0.0,
            letterSpacing: 5.0,
          ),
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Fastest Way to Find Barbers',
            style: AppTypography.dmSansTextTheme.bodyMedium?.copyWith(
              color: AppColors.whiteColor,
              height: 0.0,
            ),
          ),
        ),
      ],
    );
  }
}
