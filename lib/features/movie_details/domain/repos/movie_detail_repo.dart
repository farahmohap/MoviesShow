import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:movies_show/core/error/failure.dart';
import 'package:movies_show/features/home_view/domain/entities/movie_entity.dart';
import 'package:movies_show/features/movie_details/domain/entities/movie_detail_entity.dart';

abstract class MovieDetailRepository {

  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int movieId);

  Future<Either<Failure, List<MovieEntity>>> getRecommendationMovies(int movieId);}

