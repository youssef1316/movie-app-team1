import 'package:dartz/dartz.dart';
import 'package:movie_cellula/features/detail/domian/entites/review.dart';

import '../entites/cast.dart';
import '../entites/movie_details.dart';

abstract class BaseMovieDetailsRepository {
  Future<Either<String, MovieDetails>> getMovieDetails(int? movieId);
  Future<Either<String, List<Review>>> getMovieReview(int? movieId);
  Future<Either<String, List<Cast>>> getMovieCast(int? movieId);
}
