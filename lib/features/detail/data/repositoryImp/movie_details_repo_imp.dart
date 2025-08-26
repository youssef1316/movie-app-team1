import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_cellula/features/detail/data/dataSource/movie_detail_data_source.dart';
import 'package:movie_cellula/features/detail/domian/entites/cast.dart';
import 'package:movie_cellula/features/detail/domian/entites/review.dart';
import 'package:movie_cellula/features/detail/domian/repository/movie_details_repo.dart';

import '../../domian/entites/movie_details.dart';

@Injectable(as: BaseMovieDetailsRepository)
class MovieDetailsRepository extends BaseMovieDetailsRepository {
  BaseMovieDetailsDataSource dataSource;
  MovieDetailsRepository(this.dataSource);
  @override
  Future<Either<String, MovieDetails>> getMovieDetails(int? movieId) async {
    try {
      final movieDetails = await dataSource.getMovieDetails(movieId);
      return Right(movieDetails);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Review>>> getMovieReview(int? movieId) async {
    try {
      final reviews = await dataSource.getMovieReviews(movieId);
      return Right(reviews ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Cast>>> getMovieCast(int? movieId) async{
    try {
      final cast = await dataSource.getMovieCast(movieId);
      return Right(cast ?? []);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
