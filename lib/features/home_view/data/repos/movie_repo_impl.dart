import 'package:dartz/dartz.dart';
import 'package:movies_show/features/home_view/data/data_sources/movie_remote_datasource.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/home_view/domain/repos/movie_repo.dart';
import '../../../../core/error/failure.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final movies = await remoteDataSource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch popular movies'));
    }
  }
}
