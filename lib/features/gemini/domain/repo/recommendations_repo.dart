import '../entities/recommendations.dart';

abstract class GetRecRepo {
  Future<List<Recommendations>> getRecommendations (RecommendationInput input);
}