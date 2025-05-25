class MovieDetailEntity {
  final String posterPath;
  final String title;
  final String overview;
  final int runtime;
  final double voteAverage;

  MovieDetailEntity({
    required this.posterPath,
    required this.title,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
  });
}
