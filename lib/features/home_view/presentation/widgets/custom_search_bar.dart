import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_show/core/constants/assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onSearch; 
  
  const CustomSearchBar({super.key, required this.onSearch}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.black6B,
        borderRadius: BorderRadius.circular(60),
        boxShadow: [ 
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.searchIcon), 
          SizedBox(width: 12), 
          Expanded(
            child: TextField(
              onSubmitted: onSearch, 
              decoration: InputDecoration(
                hintText: 'Buscar',
                border: InputBorder.none,
                hintStyle: AppTextStyles.descrption.copyWith(
                  color: AppColors.greyCC,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}