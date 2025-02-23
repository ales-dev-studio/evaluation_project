import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_space.dart';
import 'package:evaluation_project/core/widgets/rate_widget.dart';
import 'package:evaluation_project/features/home_feature/presentation/bloc/home_bloc.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/filter_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BarbersWidget extends StatefulWidget {
  const BarbersWidget({super.key});

  @override
  State<BarbersWidget> createState() => _BarbersWidgetState();
}

class _BarbersWidgetState extends State<BarbersWidget> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetHomeDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
            Skeletonizer(
              enabled: state.status == Status.initial,
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (final context, final index) {
                  return const BarberItemWidget();
                },
                separatorBuilder: (final context, final index) {
                  return const AppVSpace();
                },
              ),
            )
          ],
        );
      },
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: AppTypography.dmSansTextTheme.titleSmall?.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' | Haircut ,Face Shave ,Skin Fades',
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppTypography.dmSansTextTheme.titleSmall?.copyWith(
                          color: AppColors.lightTextColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const AppHSpace(
            space: Dimens.padding,
          ),
          const RateWidget(rate: 4.0),
        ],
      ),
    );
  }
}
