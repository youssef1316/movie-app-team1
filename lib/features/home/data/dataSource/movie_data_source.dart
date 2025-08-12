import 'package:injectable/injectable.dart';
import 'package:movie_cellula/core/api/api_manager.dart';
import 'package:movie_cellula/core/entities/movie.dart';
import 'package:movie_cellula/core/entities/movie_details.dart';

abstract class BaseMovieDataSource {
  Future<List<Movie>?> getTendMovies();
  Future<List<Movie>?> getNowPlayingMovies();
  Future<List<Movie>?> getTopRatedMovies();
  Future<List<Movie>?> getUpcomingMovies();
  Future<List<Movie>?> getPopularMovies();
  Future<MovieDetails> getMovieDetails(int? movieId);
}

@Injectable(as: BaseMovieDataSource)
class MovieDataSource extends BaseMovieDataSource {
  ApiManager api;
  @factoryMethod
  MovieDataSource(this.api);
  @override
  Future<List<Movie>?> getTendMovies() async {
    try {
      var moviesList = await api.getTrendMovies();
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch trend movies: $e");
    }
  }

  @override
  Future<List<Movie>?> getNowPlayingMovies() async {
    try {
      final moviesList = await api.getNowPlayingMovies();
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch nowPlaying movies: $e");
    }
  }

  @override
  Future<List<Movie>?> getTopRatedMovies() async {
    try {
      var moviesList = await api.getTopRatedMovies();
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch top rated movies: $e");
    }
  }

  @override
  Future<List<Movie>?> getUpcomingMovies() async {
    try {
      var moviesList = await api.getUpcomingMovies();
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch upcoming movies: $e");
    }
  }

  @override
  Future<List<Movie>?> getPopularMovies() async {
    try {
      var moviesList = await api.getPopularMovies();
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch popular movies: $e");
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(int? movieId) async {
    try {
      var movieDetails = await api.getMovieDetails(movieId);
      if (movieId == null) {
        throw Exception("No movie details received from API.");
      }
      return movieDetails.toDomain();
    } catch (e) {
      throw Exception("Failed to fetch movie details: $e");
    }
  }
}
