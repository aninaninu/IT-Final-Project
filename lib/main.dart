import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_colours.dart';

void main() {
  runApp(const SummerQuestApp());
}

class SummerQuestApp extends StatelessWidget {
  const SummerQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summer Quest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkGreen,
          surface: AppColors.cream,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.cream,
          foregroundColor: AppColors.darkGreen,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.darkGreen,
            foregroundColor: AppColors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.darkGreen,
            foregroundColor: AppColors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
