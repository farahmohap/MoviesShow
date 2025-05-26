import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/core/networking/api_service.dart';
import 'package:movies_show/features/home_view/data/models/movie_model.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/movie_details/data/models/movie_detail_model.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailEntity> getMovieDetail(int movieId);
  Future<List<MovieEntity>> getRecommendationMovies(int movieId);
}

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final ApiService apiService;

  MovieDetailRemoteDataSourceImpl(this.apiService);

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await apiService.get(
      '${ApiConstants.movieDetailsBase}/$movieId',
    );
    return MovieDetailModel.fromJson(response.data);
  }

  @override
  Future<List<MovieModel>> getRecommendationMovies(int movieId) async {
    final response = await apiService.get(
      '${ApiConstants.movieDetailsBase}/$movieId/recommendations',
    );
    final results=response.data['results'] as List;
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

 
}
