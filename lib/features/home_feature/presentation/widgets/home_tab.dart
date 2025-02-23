import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/widgets/app_search_text_field.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/header_widget.dart';
import 'package:flutter/material.dart';

import 'categories_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AppVSpace(),
            HeaderWidget(),
            AppVSpace(
              space: 30.0,
            ),
            AppSearchTextField(),
            AppVSpace(
              space: 32.0,
            ),
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
