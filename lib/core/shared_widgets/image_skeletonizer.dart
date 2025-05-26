import 'package:flutter/material.dart';
import 'package:movies_show/core/constants/app_assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageSkeletonizer extends StatelessWidget {
  const ImageSkeletonizer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AppAssets.onboarding,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
