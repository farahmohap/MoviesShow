
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movie;

  MovieDetailLoaded(this.movie);
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);
}
