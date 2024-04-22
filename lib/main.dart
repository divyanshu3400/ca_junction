import 'package:ca_junction/screens/splash_screen.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CA Junction',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.primaryColor, // Set primary color for dark mode
      ),
      home: SplashScreen(),
    );
  }
}
