import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_show/core/constants/app_assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        color: AppColors.grey43,
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(60),
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.playIcon),
          SizedBox(width: 10),
          Text(
            'Assistir trailer',
            style: AppTextStyles.white16w600,
          ),
        ],
      ),
    );
  }
}
