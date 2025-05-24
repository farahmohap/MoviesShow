import 'package:dartz/dartz.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/home_view/domain/repos/movie_repo.dart';
import '../../../../core/error/failure.dart';

class GetPopularMoviesUseCase {
  final MovieRepository repository;

  GetPopularMoviesUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() {
    return repository.getPopularMovies();
  }
}
