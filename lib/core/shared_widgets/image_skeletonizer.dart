import 'package:flutter/material.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewSkeletonizer extends StatelessWidget {
  const ListViewSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                color: AppColors.grey43,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
