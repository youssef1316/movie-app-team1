abstract class ReviewsEvent {}

class GetMovieReviewsEvent extends ReviewsEvent {
  final int? movieId;
  GetMovieReviewsEvent(this.movieId);
}
