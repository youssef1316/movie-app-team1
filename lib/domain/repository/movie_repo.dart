import 'package:dartz/dartz.dart';
import 'package:movie_cellula/domain/entities/movie.dart';
import 'package:movie_cellula/domain/entities/movie_details.dart';

abstract class BaseMovieRepository{
  Future<Either<String, List<Movie>?>> getTendMovies();
  Future<Either<String, List<Movie>?>> getNowPlayingMovies();
  Future<Either<String, List<Movie>?>> getTopRatedMovies();
  Future<Either<String, List<Movie>?>> getUpcomingMovies();
  Future<Either<String, List<Movie>?>> getPopularMovies();
  Future<Either<String,MovieDetails>> getMovieDetails(int? movieId);

}

