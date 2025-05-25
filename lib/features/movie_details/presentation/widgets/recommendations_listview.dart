import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/core/service_locator.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_state.dart';
import 'package:movies_show/features/movie_details/presentation/screens/movie_details_screen.dart';

class RecommendationsListview extends StatelessWidget {
  const RecommendationsListview({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailCubit, MovieDetailState>(
      builder: (context, state) {
        if (state.recommendations == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.recommendations!.isEmpty) {
          return const Center(child: Text('No recommendations available'));
        }

        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.recommendations!.length,
            itemBuilder: (context, index) {
              final posterPath = state.recommendations![index].posterPath;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder:
                            (context) => BlocProvider(
                              create: (context) => getIt<MovieDetailCubit>(),
                              child: MovieDetailScreen(
                                movieId: state.recommendations![index].id,
                              ),
                            ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        posterPath != null
                            ? Image.network(
                              '${ApiConstants.imageBaseUrl}$posterPath',
                              fit: BoxFit.cover,
                              width: 150,
                            )
                            : const Icon(Icons.image_not_supported),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
