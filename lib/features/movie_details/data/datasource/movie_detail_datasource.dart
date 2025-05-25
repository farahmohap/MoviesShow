import 'package:dio/dio.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/core/networking/api_service.dart';
import 'package:movies_show/features/movie_details/data/models/movie_detail_model.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';
abstract class MovieDetailRemoteDataSource {
  Future<MovieDetailEntity> getMovieDetail(int movieId);
}

class MovieDetailRemoteDataSourceImpl implements MovieDetailRemoteDataSource {
  final ApiService apiService;

  MovieDetailRemoteDataSourceImpl(this.apiService);

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await apiService.get('${ApiConstants.movieDetailsBase}/$movieId');
    return MovieDetailModel.fromJson(response.data);
  }
}

