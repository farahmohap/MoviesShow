import 'package:get_it/get_it.dart';
import 'package:movies_show/core/networking/api_service.dart';
import 'package:movies_show/features/home_view/data/data_sources/movie_remote_datasource.dart';
import 'package:movies_show/features/home_view/data/repos/movie_repo_impl.dart';
import 'package:movies_show/features/home_view/domain/repos/movie_repo.dart';
import 'package:movies_show/features/home_view/domain/use_cases.dart/movie_usecase.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_cubit.dart';
import 'package:movies_show/features/movie_details/data/datasource/movie_detail_datasource.dart';
import 'package:movies_show/features/movie_details/data/repos/movie_detail_repo_impl.dart';
import 'package:movies_show/features/movie_details/domain/repos/movie_detail_repo.dart';
import 'package:movies_show/features/movie_details/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // ✅ Core
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  // ✅ DataSources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getIt()),
  );

  getIt.registerLazySingleton<MovieDetailRemoteDataSource>(
    () => MovieDetailRemoteDataSourceImpl(getIt()),
  );

  // ✅ Repositories registered as abstract types
  getIt.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getIt()),
  );

  getIt.registerLazySingleton<MovieDetailRepository>(
    () => MovieDetailRepositoryImpl(getIt()),
  );

  // ✅ UseCases
  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(getIt()),
  );

  getIt.registerLazySingleton<GetMovieDetailUseCase>(
    () => GetMovieDetailUseCase(getIt()),
  );

  // ✅ Cubits
  getIt.registerFactory(() => MovieCubit(getIt()));
  getIt.registerFactory(() => MovieDetailCubit(getIt()));
}
