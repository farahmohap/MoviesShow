import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_show/core/constants/assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';

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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(AppAssets.onboardingHeader),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 28,
                        height: 1.3,
                        color: Colors.white,
                      ),
                      children: [
                        const TextSpan(text: 'Tudo sobre '),
                        TextSpan(
                          text: 'filmes, séries, animes e muito mais.',
                          style: AppTextStyles.title,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Fique por dentro das informações de filmes, séries, animes e muito mais.',
                    style: AppTextStyles.descrption,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 314,
                    height: 43,
                    decoration: BoxDecoration(
                      color: AppColors.grey43,
                      gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                      ),
                      borderRadius: BorderRadius.circular(60),
                    ),

                    child: Center(
                      child: Text('Acessar', style: AppTextStyles.btnText),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
