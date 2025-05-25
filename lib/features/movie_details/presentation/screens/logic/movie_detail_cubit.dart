import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_movie_detail_usecase.dart';
import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetailUseCase useCase;

  MovieDetailCubit(this.useCase) : super(MovieDetailInitial());

  Future<void> fetchMovieDetail(int movieId) async {
    emit(MovieDetailLoading());

    final result = await useCase(movieId);
    result.fold(
      (failure) => emit(MovieDetailError(failure.message)),
      (movie) => emit(MovieDetailLoaded(movie)),
    );
  }
}
