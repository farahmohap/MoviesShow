import 'package:flutter/material.dart';
import 'package:movies_show/core/service_locator.dart';
import 'package:movies_show/features/onboarding/screens/onboard_screen.dart';

void main() {
  setupServiceLocator();
  runApp(const MoviesShowApp());
}

class MoviesShowApp extends StatelessWidget {
  const MoviesShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
