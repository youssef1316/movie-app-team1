import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/detail/domian/entites/movie_details.dart';
import 'package:movie_cellula/features/detail/domian/repository/movie_details_repo.dart';
import 'package:movie_cellula/features/home/domain/repository/movie_repo.dart';

@injectable
class GetMovieDetailsUseCase {
  BaseMovieDetailsRepository repository;
  GetMovieDetailsUseCase(this.repository);
  Future<Either<String, MovieDetails>> invoke(int? movieId) {
    return repository.getMovieDetails(movieId);
  }
}

