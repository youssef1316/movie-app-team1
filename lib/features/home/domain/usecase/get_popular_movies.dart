import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/home/domain/repository/movie_repo.dart';

import '../entities/movie.dart';

@injectable
class GetPopularMoviesUseCase{
  BaseMovieRepository repository;
  GetPopularMoviesUseCase(this.repository);
  Future<Either<String,List<Movie>?>> invoke()async{
    return await repository.getPopularMovies();
  }

}