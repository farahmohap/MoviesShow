import 'package:dartz/dartz.dart';
import 'package:movies_show/core/error/failure.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';
import 'package:movies_show/features/movie_details/domain/repos/movie_detail_repo.dart';

class GetMovieDetailUseCase {
  final MovieDetailRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<Either<Failure, MovieDetailEntity>> getMovieDetails(
    int movieId,
  ) async {
    return await repository.getMovieDetail(movieId);
  }

  Future<Either<Failure, List<MovieEntity>>> getRecommendationMovies(
    int movieId,
  ) async {
    return await repository.getRecommendationMovies(movieId);
  }
}
