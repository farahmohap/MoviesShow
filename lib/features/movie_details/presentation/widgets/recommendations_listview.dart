import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/features/movie_details/presentation/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/logic/movie_detail_state.dart';

class RecommendationsListview extends StatelessWidget {
  final int movieId;
  final Function(int newMovieId) onMovieTap;

  const RecommendationsListview({
    super.key,
    required this.movieId,
    required this.onMovieTap,
  });

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
              final movie = state.recommendations![index];
              return GestureDetector(
                onTap: () {
                  onMovieTap(movie.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                      fit: BoxFit.cover,
                      width: 150,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50),
                    ),
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

