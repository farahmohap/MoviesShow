import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/core/service_locator.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_cubit.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_states.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/screens/movie_details.dart';

class CategoeyMoviesListView extends StatelessWidget {
  const CategoeyMoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieSuccess) {
            final List<MovieEntity> movies = state.movies;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final posterPath = movies[index].posterPath;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      posterPath != null
                          ? InkWell(
                            onTap: () {
                              log(movies[index].id.toString());
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => BlocProvider(
                                        create:
                                            (context) =>
                                                getIt<MovieDetailCubit>(),
                                        child: MovieDetailScreen(
                                          movieId: movies[index].id,
                                        ),
                                      ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                '${ApiConstants.imageBaseUrl}$posterPath',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 250,
                                errorBuilder:
                                    (context, error, stackTrace) => const Icon(
                                      Icons.broken_image,
                                      size: 50,
                                    ),
                              ),
                            ),
                          )
                          : const Icon(Icons.image_not_supported),
                );
              },
            );
          } else if (state is MovieFailure) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
