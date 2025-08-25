import 'package:movie_cellula/features/gemini/domain/entities/recommendations.dart';

abstract class RecommendationEvent {}

class GetMoviesRecommendationsEvent extends RecommendationEvent {
  final RecommendationInput input;
  GetMoviesRecommendationsEvent(this.input);
}
