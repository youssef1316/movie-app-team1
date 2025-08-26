import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/gemini/domain/usecase/get_recommendations_usecase.dart';
import 'package:movie_cellula/features/gemini/presentation/bloc/rec_event.dart';
import 'package:movie_cellula/features/gemini/presentation/bloc/rec_state.dart';

class MovieRecommendationsBloc
    extends Bloc<RecommendationEvent, RecommendationState> {
  GetRecommendationUseCase useCase;
  MovieRecommendationsBloc(this.useCase)
    : super(RecommendationLoadingStateState()) {
    on<GetMoviesRecommendationsEvent>(getRecommendations);
  }
  Future<void> getRecommendations(
    GetMoviesRecommendationsEvent event,
    Emitter<RecommendationState> emit,
  ) async {
    final recommendations = await useCase.call(event.input);
    if (recommendations.isEmpty) {
      emit(RecommendationErrorState("No Movies Found"));
    } else if (recommendations.isNotEmpty) {
      emit(RecommendationSuccessState(recommendations));
    }
  }
}
