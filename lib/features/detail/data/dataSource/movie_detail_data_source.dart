import 'package:injectable/injectable.dart';
import 'package:movie_cellula/core/api/api_manager.dart';
import 'package:movie_cellula/features/detail/domian/entites/cast.dart';
import 'package:movie_cellula/features/detail/domian/entites/review.dart';

import '../../domian/entites/movie_details.dart';

abstract class BaseMovieDetailsDataSource {
  Future<MovieDetails> getMovieDetails(int? movieId);
  Future<List<Review>?> getMovieReviews(int? movieId);
  Future<List<Cast>?> getMovieCast(int? movieId);
}

@Injectable(as: BaseMovieDetailsDataSource)
class MovieDetailsDataSource extends BaseMovieDetailsDataSource {
  ApiManager apiManager;
  MovieDetailsDataSource(this.apiManager);
  @override
  Future<MovieDetails> getMovieDetails(int? movieId) async {
    try {
      var movieDetails = await apiManager.getMovieDetails(movieId);
      if (movieId == null) {
        throw Exception("No movie details received from API.");
      }
      return movieDetails.toDomain();
    } catch (e) {
      throw Exception("Failed to fetch movie details: $e");
    }
  }
  @override
  Future<List<Review>?> getMovieReviews(int? movieId) async {
    try {
      var result = await apiManager.getMovieReviews(movieId);
      if (result == null) {
        throw Exception("No reviews received from API.");
      }
      return result.map((review) => review.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch Reviews $e");
    }
  }

  @override
  Future<List<Cast>?> getMovieCast(int? movieId) async{
    try {
      var result = await apiManager.getMovieCast(movieId);
      var castList = result.cast;
      return castList?.map((cast) => cast.toDomain()).toList();

    } catch (e) {
      throw Exception("Failed to Reviews $e");
    }
  }
}
