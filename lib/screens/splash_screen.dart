import 'dart:async';

import 'package:ca_junction/screens/onboarding_screen1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
      Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, OnboardingScreen1.id);
    });
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(16, 13, 64, 1),
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage("assets/images/Group 8956.png"),
        ),
      ),
    );
  }
}
