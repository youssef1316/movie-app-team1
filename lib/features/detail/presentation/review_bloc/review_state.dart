import 'package:movie_cellula/features/detail/domian/entites/review.dart';

abstract class ReviewState {}


class ReviewLoadingState extends ReviewState {}

class ReviewErrorState extends ReviewState {
  final String? errorMsg;
  ReviewErrorState(this.errorMsg);
}

class ReviewSuccessState extends ReviewState {
  final List<Review> reviews;
  ReviewSuccessState(this.reviews);
}
