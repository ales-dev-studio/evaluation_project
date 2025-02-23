import 'package:evaluation_project/core/theme/colors.dart';
import 'package:evaluation_project/core/theme/typography.dart';
import 'package:evaluation_project/features/home_feature/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter evaluation project',
      theme: ThemeData(
        useMaterial3: true,
        // Apply the custom DM Sans typography
        textTheme: AppTypography.dmSansTextTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
