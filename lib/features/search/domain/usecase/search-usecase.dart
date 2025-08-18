import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/search/domain/repository/search_repository.dart';

import '../../../home/domain/entities/movie.dart';


@injectable
class SearchMoviesUseCase {
  BaseSearchRepository repository;
  SearchMoviesUseCase(this.repository);
  Future<Either<String, List<Movie>?>> searchMovie(String movieName) {
    return repository.searchMovie(movieName);
  }
}


