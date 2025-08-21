import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/detail/domian/entites/cast.dart';
import 'package:movie_cellula/features/detail/domian/repository/movie_details_repo.dart';
@injectable
class MovieCastUseCase{
  BaseMovieDetailsRepository repository;
  MovieCastUseCase(this.repository);
  Future<Either<String,List<Cast>>> invoke(int? movieId){
    return repository.getMovieCast(movieId);
  }
}