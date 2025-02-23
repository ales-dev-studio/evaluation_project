import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:evaluation_project/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key, required this.onPressed});

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.corners * 2),
          ),
        ),
      ),
      child: Row(
        children: [
          AppSvgViewer(
            path: Assets.icons.filter,
            color: AppColors.whiteColor,
            setDefaultColor: false,
            setDefaultWidthAndHeight: false,
            width: 18.0,
            height: 12.0,
          ),
          const AppHSpace(
            space: Dimens.smallPadding,
          ),
          Text(
            'Filter',
            style: AppTypography.dmSansTextTheme.bodyLarge?.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
