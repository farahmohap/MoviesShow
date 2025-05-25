class MovieDetailEntity {
  final String posterPath;
  final String title;
  final String overview;
  final int runtime;
  final double voteAverage;
  final String releaseDate;

  MovieDetailEntity({
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
  });
}
