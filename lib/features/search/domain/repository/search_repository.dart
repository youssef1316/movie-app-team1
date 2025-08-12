import 'package:dartz/dartz.dart';
import 'package:movie_cellula/core/entities/movie.dart';

abstract class BaseSearchRepository{
  Future<Either<String, List<Movie>?>> searchMovie(String movieName);
}