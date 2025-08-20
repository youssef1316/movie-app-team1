import 'package:dartz/dartz.dart';

import '../../../home/domain/entities/movie.dart';


abstract class BaseSearchRepository{
  Future<Either<String, List<Movie>?>> searchMovie(String movieName);
}