import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:evaluation_project/core/widgets/app_svg_viewer.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      'HAIRCUT',
      'FACE SHAVE',
      'SKIN FADES',
      'COLORING',
    ];

    final List<String> icons = [
      Assets.icons.haircut,
      Assets.icons.faceShave,
      Assets.icons.skinFade,
      Assets.icons.coloring,
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryItemWidget(
          iconPath: icons[0],
          title: titles[0],
        ),
        CategoryItemWidget(
          iconPath: icons[1],
          title: titles[1],
        ),
        CategoryItemWidget(
          iconPath: icons[2],
          title: titles[2],
        ),
        CategoryItemWidget(
          iconPath: icons[3],
          title: titles[3],
        ),
      ],
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSvgViewer(
          path: iconPath,
          setDefaultColor: false,
          height: 38.0,
        ),
        const AppVSpace(space: Dimens.padding),
        Text(
          title,
          style: AppTypography.dmSansTextTheme.bodySmall?.copyWith(
            color: AppColors.veryLightTextColor,
            height: 0.0,
          ),
        ),
      ],
    );
  }
}
