import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_show/core/constants/assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.black6B,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                fillColor: AppColors.pink8A,
                border: InputBorder.none,
                hintStyle: AppTextStyles.descrption.copyWith(
                  color: AppColors.greyCC,
                ),
              ),
            ),
          ),

          SvgPicture.asset(AppAssets.searchIcon),
        ],
      ),
    );
  }
}
