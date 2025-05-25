import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  MovieDetailModel({
    required super.posterPath,
    required super.title,
    required super.overview,
    required super.runtime,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      posterPath: json['poster_path'] ?? '',
      title: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      runtime: json['runtime'] ?? 0,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? '',
    );
  }
}
