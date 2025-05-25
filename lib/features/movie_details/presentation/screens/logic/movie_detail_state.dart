import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState {
  final MovieDetailEntity? movie;
  final List<MovieEntity>? recommendations;

  const MovieDetailState({this.movie, this.recommendations});
}

class MovieDetailInitial extends MovieDetailState {
  const MovieDetailInitial() : super();
}

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading({super.movie, super.recommendations});
}

class MovieDetailLoaded extends MovieDetailState {
  const MovieDetailLoaded(MovieDetailEntity movie, {List<MovieEntity>? recommendations})
      : super(movie: movie, recommendations: recommendations);
}

class MovieDetailError extends MovieDetailState {
  final String message;
  const MovieDetailError(this.message, {super.movie, super.recommendations});
}