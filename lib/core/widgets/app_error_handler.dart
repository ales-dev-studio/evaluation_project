import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:flutter/material.dart';

class AppErrorHandler extends StatelessWidget {
  const AppErrorHandler({
    super.key,
    this.onReloadButtonTap,
    this.errorMessage,
    this.textStyle,
  });

  final String? errorMessage;
  final GestureTapCallback? onReloadButtonTap;
  final TextStyle? textStyle;

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const AppVSpace(),
          Text(
            errorMessage ?? 'An error has occurred',
            textAlign: TextAlign.center,
            style: textStyle ??
                AppTypography.dmSansTextTheme.bodyLarge?.copyWith(
                  color: AppColors.whiteColor,
                ),
          ),
          const AppVSpace(),
          if (onReloadButtonTap != null)
            OutlinedButton(
              onPressed: onReloadButtonTap,
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimens.corners * 2),
                  ),
                ),
              ),
              child: Text(
                'Reload',
                style: AppTypography.dmSansTextTheme.bodyLarge?.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          const AppVSpace(),
        ],
      ),
    );
  }
}
