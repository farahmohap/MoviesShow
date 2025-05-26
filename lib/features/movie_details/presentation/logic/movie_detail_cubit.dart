import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';
import 'package:movies_show/features/movie_details/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_show/features/movie_details/presentation/logic/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetailUseCase useCase;
  
  MovieDetailEntity? _movie;
  List<MovieEntity>? _recommendations;

  MovieDetailCubit(this.useCase) : super(MovieDetailInitial());

  // external access
  MovieDetailEntity? get movie => _movie;
  List<MovieEntity>? get recommendations => _recommendations;

  Future<void> fetchMovieDetail(int movieId) async {
    emit(MovieDetailLoading());

    final result = await useCase.getMovieDetails(movieId);
    result.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (movie) {
        _movie = movie;
        emit(MovieDetailLoaded());
      },
    );
  }

  Future<void> fetchRecommendationMovies(int movieId) async {
    emit(MovieDetailLoading());

    final result = await useCase.getRecommendationMovies(movieId);
    result.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (recommendations) {
        _recommendations = recommendations;
        emit(MovieDetailLoaded());
      },
    );
  }
}