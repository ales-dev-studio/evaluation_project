import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:flutter/material.dart';

import 'filter_button_widget.dart';

class BarbersWidget extends StatelessWidget {
  const BarbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '100 Barber Shop/barbers',
              style: AppTypography.dmSansTextTheme.titleMedium?.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            FilterButtonWidget(
              onPressed: () {},
            )
          ],
        ),
        const AppVSpace(),
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (final context , final index){
            return const BarberItemWidget();
          },
          separatorBuilder: (final context , final index){
            return const AppVSpace();
          },
        )
      ],
    );
  }
}


class BarberItemWidget extends StatelessWidget {
  const BarberItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      padding: const EdgeInsets.all(Dimens.padding),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(
          Dimens.corners,
        ),
        border: Border.all(
          color: AppColors.veryLightTextColor,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 93.0,
            height: 93.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                Dimens.corners,
              ),
              child: Image.asset(
                Assets.images.banner.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const AppHSpace(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppVSpace(
                  space: Dimens.smallPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'William Rojer Salon',
                      style:
                      AppTypography.dmSansTextTheme.titleMedium?.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                const AppVSpace(
                  space: 6.0,
                ),
                Text(
                  'Haircut ,Face Shave ,Skin Fades',
                  style: AppTypography.dmSansTextTheme.bodyMedium?.copyWith(
                    color: AppColors.veryLightTextColor,
                    height: 0.0,
                  ),
                ),
                const AppVSpace(
                  space: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '5.0 Kms',
                      style:
                      AppTypography.dmSansTextTheme.titleSmall?.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' | Haircut ,Face Shave ,Skin Fades'
                            'Fades'
                            'Fades'
                            'Fades',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.dmSansTextTheme.titleSmall
                            ?.copyWith(
                          color: AppColors.lightTextColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
