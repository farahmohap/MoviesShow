import 'package:flutter/material.dart';
import 'package:movies_show/core/constants/app_assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/features/onboarding/widgets/footer_section.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(AppAssets.onboarding, fit: BoxFit.cover),
          ),
          Container(color: AppColors.black1D.withOpacity(0.5)),
          FooterSection(),
        ],
      ),
    );
  }
}
