import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:flutter/material.dart';

class DotIcon extends StatelessWidget {
  const DotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.0,
      height: 6.0,
      margin: const EdgeInsets.only(top: 6.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(Dimens.corners),
      ),
    );
  }
}
