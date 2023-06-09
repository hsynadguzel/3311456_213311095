import 'package:e_commerce/screens/user_operations/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _buildSplash();
    super.initState();
  }

  void _buildSplash() async {
    await Future.delayed(
      const Duration(milliseconds: 2000),
    ).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/apps.png',
            width: 100.0,
          ),
        ),
      ),
    );
  }
}
