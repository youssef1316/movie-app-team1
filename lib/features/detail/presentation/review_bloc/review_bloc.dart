import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/detail/domian/usecsae/get_movie_reviews.dart';
import 'package:movie_cellula/features/detail/presentation/review_bloc/review_event.dart';
import 'package:movie_cellula/features/detail/presentation/review_bloc/review_state.dart';

class GetMovieReviewsBloc extends Bloc<ReviewsEvent, ReviewState> {
  MovieReviewsUseCase useCase;
  GetMovieReviewsBloc(this.useCase) : super(ReviewLoadingState()) {
    on<GetMovieReviewsEvent>(getReviews);
  }
  Future<void> getReviews(
    GetMovieReviewsEvent event,
    Emitter<ReviewState> emit,
  ) async {
    try {
      final result = await useCase.invoke(event.movieId);
      emit(ReviewLoadingState());
      result.fold(
        (l) => emit(ReviewErrorState(l)),
        (r) => emit(ReviewSuccessState(r)),
      );
    } catch (e) {
      emit(ReviewErrorState(e.toString()));
    }
  }
}
