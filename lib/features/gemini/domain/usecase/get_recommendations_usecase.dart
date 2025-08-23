import '../entities/recommendations.dart';
import '../repo/recommendations_repo.dart';

class GetRecommendationUseCase {
  final GetRecRepo _repo;
  GetRecommendationUseCase (this._repo);

  Future<List<Recommendations>> call (RecommendationInput input) {
    return _repo.getRecommendations(input);
  }

}