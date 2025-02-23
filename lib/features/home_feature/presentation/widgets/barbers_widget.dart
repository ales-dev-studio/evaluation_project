import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/dimens.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/core/widgets/app_error_handler.dart';
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
    init();
    super.initState();
  }

  void init() {
    context.read<HomeBloc>().add(GetHomeDataEvent());
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
            if (state.status == Status.failure)
              AppErrorHandler(
                onReloadButtonTap: init,
              )
            else
              Skeletonizer(
                enabled: state.status == Status.initial,
                child: Column(
                  children: [
                    if (state.status == Status.success) ...[
                      SizedBox(
                        height: 40.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.servicesList!.results!.length,
                          shrinkWrap: true,
                          itemBuilder: (final context, final index) {
                            return FilterItemWidget(
                              index: index,
                            );
                          },
                          separatorBuilder: (final context, final index) {
                            return const AppHSpace(
                              space: Dimens.padding,
                            );
                          },
                        ),
                      ),
                      const AppVSpace(),
                    ],
                    ListView.separated(
                      itemCount: state.status == Status.initial
                          ? 10
                          : state.barbersList!.results!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (final context, final index) {
                        return BarberItemWidget(
                          index: index,
                          showFakeData: state.status == Status.initial,
                        );
                      },
                      separatorBuilder: (final context, final index) {
                        return const AppVSpace();
                      },
                    ),
                  ],
                ),
              )
          ],
        );
      },
    );
  }
}

class BarberItemWidget extends StatelessWidget {
  const BarberItemWidget({
    super.key,
    required this.index,
    required this.showFakeData,
  });

  final int index;
  final bool showFakeData;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeBloc>();
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
                Expanded(
                  child: Text(
                    showFakeData
                        ? 'William Rojer Salon'
                        : watch.state.barbersList!.results![index].fullname ??
                            '',
                    style: AppTypography.dmSansTextTheme.titleMedium?.copyWith(
                      color: AppColors.blackColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
          if (!showFakeData) const RateWidget(rate: 4.0),
        ],
      ),
    );
  }
}

class FilterItemWidget extends StatelessWidget {
  const FilterItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeBloc>();

    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.corners * 2),
          ),
        ),
      ),
      child: Text(
        watch.state.servicesList!.results![index].title ?? '',
        style: AppTypography.dmSansTextTheme.bodyLarge?.copyWith(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
