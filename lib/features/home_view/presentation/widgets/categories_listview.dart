import 'package:flutter/material.dart';
import 'package:movies_show/core/constants/categories.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';

class HomeCategoriesListview extends StatefulWidget {
  const HomeCategoriesListview({super.key});

  @override
  State<HomeCategoriesListview> createState() => _HomeCategoriesListviewState();
}

class _HomeCategoriesListviewState extends State<HomeCategoriesListview> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final isSelected = selectedCategoryIndex == index;
          return InkWell(
            onTap: () => _changeCategory(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.pink8A : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(categories[index], style: AppTextStyles.white16w600),
              ),
            ),
          );
        },
      ),
    );
  }

  void _changeCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }
}
