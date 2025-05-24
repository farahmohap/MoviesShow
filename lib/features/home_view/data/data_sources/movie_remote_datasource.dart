import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/features/home_view/data/models/movie_model.dart';
import 'package:movies_show/core/networking/api_service.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService apiService;

  MovieRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await apiService.get(ApiConstants.popularMovies);
    final results = response.data['results'] as List;
    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
