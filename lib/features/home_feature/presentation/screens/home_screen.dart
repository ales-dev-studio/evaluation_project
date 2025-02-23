import 'package:evaluation_project/core/gen/assets.gen.dart';
import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/widgets/app_svg_viewer.dart';
import 'package:evaluation_project/core/widgets/dot_icon.dart';
import 'package:evaluation_project/features/home_feature/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/favorites_tab.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/home_tab.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/map_tap.dart';
import 'package:evaluation_project/features/home_feature/presentation/widgets/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>(
      create: (context) => BottomNavigationCubit(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<BottomNavigationCubit>();
    final read = context.read<BottomNavigationCubit>();

    // List of screens to display for each tab
    final List<Widget> screens = [
      const HomeTab(),
      const FavoritesTab(),
      const MapTap(),
      const ProfileTab(),
    ];

    return Scaffold(
      body: screens[watch.state.selectedIndex],
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          currentIndex: watch.state.selectedIndex,
          onTap: (final int index) {
            read.onBottomNavigationItemTap(index: index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AppSvgViewer(
                path: Assets.icons.home,
              ),
              activeIcon: Column(
                children: [
                  AppSvgViewer(
                    path: Assets.icons.home,
                    color: AppColors.primaryColor,
                    setDefaultColor: false,
                  ),
                  const DotIcon()
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AppSvgViewer(
                path: Assets.icons.favorites,
              ),
              activeIcon: Column(
                children: [
                  AppSvgViewer(
                    path: Assets.icons.favorites,
                    color: AppColors.primaryColor,
                    setDefaultColor: false,
                  ),
                  const DotIcon()
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AppSvgViewer(
                path: Assets.icons.map,
              ),
              activeIcon: Column(
                children: [
                  AppSvgViewer(
                    path: Assets.icons.map,
                    color: AppColors.primaryColor,
                    setDefaultColor: false,
                  ),
                  const DotIcon()
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: AppSvgViewer(
                path: Assets.icons.user,
              ),
              activeIcon: Column(
                children: [
                  AppSvgViewer(
                    path: Assets.icons.user,
                    color: AppColors.primaryColor,
                    setDefaultColor: false,
                  ),
                  const DotIcon()
                ],
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
