import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/domain/entities/movie.dart';
import 'package:movie_cellula/domain/repository/movie_repo.dart';
@injectable
class GetTopRatedMoviesUseCase {
  final BaseMovieRepository repository;
  GetTopRatedMoviesUseCase(this.repository);
  Future<Either<String, List<Movie>?>> invoke() async {
    return await repository.getTopRatedMovies();
  }
}
