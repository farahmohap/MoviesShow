import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/features/home_view/domain/use_cases.dart/movie_usecase.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_states.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MovieCubit(this.getPopularMoviesUseCase) : super(MovieInitial());

  Future<void> fetchPopularMovies() async {
    emit(MovieLoading());
    final result = await getPopularMoviesUseCase();

    result.fold(
      (failure) => emit(MovieFailure(failure.message)),
      (movies) => emit(MovieSuccess(movies)),
    );
  }
}
