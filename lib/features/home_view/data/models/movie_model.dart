
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({required super.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(posterPath: json['poster_path']);
  }
}
