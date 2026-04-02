import 'package:flutter/material.dart';
import '../views/login_screen.dart';

class SplashViewModel {
  static Future<void> iniciar(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (!context.mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }
}
