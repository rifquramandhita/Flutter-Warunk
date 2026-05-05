import 'package:flutter/material.dart';
import 'package:warunk/app/features/auth/presentation/splash/auth_splash_screen.dart';
import 'package:warunk/core/theme/app_theme.dart';

void main() {
  runApp(const WarunkApp());
}

class WarunkApp extends StatelessWidget {
  const WarunkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warunk',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const AuthSplashScreen(),
    );
  }
}
