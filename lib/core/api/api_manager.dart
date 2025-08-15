import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';
import '../../core/utils/app_constants.dart';
import 'package:http/http.dart' as http;

import '../../features/home/data/models/movie_details_model.dart';
import '../../features/home/data/models/movie_model.dart';
import '../../features/home/data/models/movie_response.dart';

@singleton
class ApiManager {
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.topRatedMovieEndPoint,
        {"api_key": AppConstants.apiKey},
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<MovieModel>> getTrendMovies() async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.trendMoviesEndPoint,
        {"api_key": AppConstants.apiKey},
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.nowPlayingMoviesEndPoint,
        {"api_key": AppConstants.apiKey},
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.upcomingMoviesEndPoint,
        {"api_key": AppConstants.apiKey},
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.popularMoviesEndPoint,
        {"api_key": AppConstants.apiKey},
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<MovieDetailsModel> getMovieDetails(int? movieId) async {
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        "${AppConstants.movieDetailsEndPoint}/$movieId",
        { "api_key": AppConstants.apiKey },
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var movieDetails = MovieDetailsModel.fromJson(json);
        return movieDetails;
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }

  Future<List<MovieModel>> searchMovie(String movieName) async{
    try {
      var url = Uri.https(
        AppConstants.baseUrl,
        AppConstants.searchEndPoint,
        {
          "api_key": AppConstants.apiKey,
          "query": movieName
        },
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesResponse = MovieResponse.fromJson(json);
        return moviesResponse.results ?? [];
      } else {
        throw HttpException("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
