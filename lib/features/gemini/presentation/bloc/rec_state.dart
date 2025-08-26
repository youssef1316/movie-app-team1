import 'package:movie_cellula/features/gemini/domain/entities/recommendations.dart';

abstract class RecommendationState {}

class RecommendationErrorState extends RecommendationState {
  final String? errorMsg;
  RecommendationErrorState(this.errorMsg);
}

class RecommendationSuccessState extends RecommendationState {
  final List<Recommendations> recs;
  RecommendationSuccessState(this.recs);
}

class RecommendationLoadingStateState extends RecommendationState {}
