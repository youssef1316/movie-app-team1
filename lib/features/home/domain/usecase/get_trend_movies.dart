import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/core/entities/movie.dart';
import 'package:movie_cellula/features/home/domain/repository/movie_repo.dart';

@injectable
class GetTrendMoviesUseCase {
  final BaseMovieRepository repository;
  GetTrendMoviesUseCase(this.repository);
  Future<Either<String, List<Movie>?>> invoke() async {
    return await repository.getTendMovies();
  }
}
