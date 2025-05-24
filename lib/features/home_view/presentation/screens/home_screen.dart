import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/constants/assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_cubit.dart';
import 'package:movies_show/features/home_view/presentation/widgets/categories_listview.dart';
import 'package:movies_show/features/home_view/presentation/widgets/category_movies_listview.dart';
import 'package:movies_show/features/home_view/presentation/widgets/custom_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'O que você quer\nassistir hoje?',
                      style: AppTextStyles.header,
                    ),
                    Image.asset(AppAssets.avatar),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomSearchBar(),
                const SizedBox(height: 20),
                HomeCategoriesListview(),
                const SizedBox(height: 20),
                CategoeyMoviesListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
