import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/search/data/dataSource/search_data_source.dart';
import 'package:movie_cellula/features/search/domain/repository/search_repository.dart';

import '../../../home/domain/entities/movie.dart';

@Injectable(as: BaseSearchRepository)
class SearchRepository extends BaseSearchRepository {
  final BaseSearchDataSource dataSource;

  @factoryMethod
  SearchRepository(this.dataSource);

  @override
  Future<Either<String, List<Movie>?>> searchMovie(String movieName) async {
    try {
      final movies = await dataSource.searchMovie(movieName);
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }
}