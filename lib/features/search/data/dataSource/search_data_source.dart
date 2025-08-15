import 'package:injectable/injectable.dart';
import 'package:movie_cellula/core/api/api_manager.dart';

import '../../../home/domain/entities/movie.dart';

abstract class BaseSearchDataSource {
  Future<List<Movie>?> searchMovie(String movieName);
}

@Injectable(as: BaseSearchDataSource)
class SearchDataSource extends BaseSearchDataSource {
  ApiManager api;

  @factoryMethod
  SearchDataSource(this.api);

  @override
  Future<List<Movie>?> searchMovie(String movieName) async {
    try {
      var moviesList = await api.searchMovie(movieName);
      if (moviesList == null) {
        throw Exception("No movies received from API.");
      }
      return moviesList.map((movie) => movie.toDomain()).toList();
    } catch (e) {
      throw Exception("Failed to fetch trend movies: $e");
    }
  }
}