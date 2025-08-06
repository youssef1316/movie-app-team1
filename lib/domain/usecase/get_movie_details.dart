import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/domain/entities/movie_details.dart';
import 'package:movie_cellula/domain/repository/movie_repo.dart';

@injectable
class GetMovieDetailsUseCase {
  BaseMovieRepository repository;
  GetMovieDetailsUseCase(this.repository);
  Future<Either<String, MovieDetails>> invoke(int? movieId) {
    return repository.getMovieDetails(movieId);
  }
}
