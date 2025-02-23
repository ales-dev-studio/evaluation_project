import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/widgets/app_svg_viewer.dart';
import 'package:evaluation_project/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({
    super.key,
    this.onChanged,
  });

  final ValueChanged<String>? onChanged;

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          Dimens.corners,
        ),
      ),
      child: AppTextFormField(
        maxLength: 30,
        hinText: 'Search in Barbers, Location and services ...',
        hintStyle: const TextStyle(
          color: AppColors.lightTextColor,
          fontSize: 14.0,
        ),
        suffixIcon: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Dimens.padding,
            vertical: 1,
          ),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(
              Dimens.corners,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppSvgViewer(
              path: Assets.icons.search,
              color: AppColors.whiteColor,
              setDefaultColor: false,
              setDefaultWidthAndHeight: false,
              width: 20.0,
              height: 20.0,
            ),
          ),
        ),
        onChanged: onChanged,
        centerText: true,
      ),
    );
  }
}
