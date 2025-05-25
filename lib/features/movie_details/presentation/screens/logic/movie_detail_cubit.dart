import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/features/movie_details/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetailUseCase useCase;

  MovieDetailCubit(this.useCase) : super(MovieDetailInitial());

  Future<void> fetchMovieDetail(int movieId) async {
    emit(MovieDetailLoading(
      movie: state.movie,
      recommendations: state.recommendations,
    ));

    final result = await useCase.getMovieDetails(movieId);
    result.fold(
      (failure) => emit(MovieDetailError(
        failure.message,
        movie: state.movie,
        recommendations: state.recommendations,
      )),
      (movie) => emit(MovieDetailLoaded(
        movie,
        recommendations: state.recommendations,
      )),
    );
  }

  Future<void> fetchRecommendationMovies(int movieId) async {
    emit(MovieDetailLoading(
      movie: state.movie,
      recommendations: state.recommendations,
    ));

    final result = await useCase.getRecommendationMovies(movieId);
    result.fold(
      (failure) => emit(MovieDetailError(
        failure.message,
        movie: state.movie,
        recommendations: state.recommendations,
      )),
      (recommendations) => emit(MovieDetailLoaded(
        state.movie!,
        recommendations: recommendations,
      )),
    );
  }
}