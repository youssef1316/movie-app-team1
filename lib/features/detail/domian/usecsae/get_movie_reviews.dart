import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/detail/domian/entites/review.dart';
import 'package:movie_cellula/features/detail/domian/repository/movie_details_repo.dart';

@injectable
class MovieReviewsUseCase{
  BaseMovieDetailsRepository repository;
  MovieReviewsUseCase(this.repository);
  Future<Either<String, List<Review>>> invoke(int? movieId){
    return repository.getMovieReview(movieId);
  }
}