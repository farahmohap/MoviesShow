import 'package:dartz/dartz.dart';
import 'package:movies_show/core/error/failure.dart';
import 'package:movies_show/features/movie_details/data/datasource/movie_detail_datasource.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';
import 'package:movies_show/features/movie_details/domain/repos/movie_detail_repo.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository {
  final MovieDetailRemoteDataSource remoteDataSource;

  MovieDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int movieId) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(movieId);
      return Right(movie);
    } catch (e, stack) {
  print('❌ Error in repository: $e');
  print('🧵 Stack trace: $stack');
  return Left(ServerFailure('Failed to fetch movie details'));
}

  }
}
