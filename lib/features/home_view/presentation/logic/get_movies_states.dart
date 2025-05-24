
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';

abstract class MovieState  {
  const MovieState();
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieEntity> movies;

  const MovieSuccess(this.movies);

}

class MovieFailure extends MovieState {
  final String message;

  const MovieFailure(this.message);


}
