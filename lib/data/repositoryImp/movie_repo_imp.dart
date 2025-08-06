import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/data/dataSource/movie_data_source.dart';
import 'package:movie_cellula/domain/entities/movie_details.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repo.dart';

@Injectable(as: BaseMovieRepository)
class MovieRepository extends BaseMovieRepository {
 final  BaseMovieDataSource dataSource;
  @factoryMethod
  MovieRepository(this.dataSource);
 @override
 Future<Either<String, List<Movie>?>> getTendMovies()async {
   try {
     final movies = await dataSource.getTendMovies();
     return Right(movies);
   } catch (e) {
     return Left(e.toString());
   }
 }

  @override
  Future<Either<String, List<Movie>?>> getTopRatedMovies() async {
    try {
      final movies = await dataSource.getTopRatedMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>?>> getNowPlayingMovies() async{
    try {
      final movies = await dataSource.getNowPlayingMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>?>> getUpcomingMovies() async{
    try {
      final movies = await dataSource.getUpcomingMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>?>> getPopularMovies() async{
    try {
      final movies = await dataSource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, MovieDetails>> getMovieDetails(int? movieId) async{
    try {
      final movieDetails = await dataSource.getMovieDetails(movieId);
      return Right(movieDetails);
    } catch (e) {
      return Left(e.toString());
    }
  }


}
