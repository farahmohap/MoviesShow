
import 'package:flutter/material.dart';
import 'package:movies_show/core/constants/assets.dart';

class CategoeyMoviesListView extends StatelessWidget {
  const CategoeyMoviesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 250,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppAssets.onboarding),
          );
        },
      ),
    );
  }
}
