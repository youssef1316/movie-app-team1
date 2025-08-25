import 'package:injectable/injectable.dart';

import '../entities/recommendations.dart';
import '../repo/recommendation_repo.dart';
@injectable
class GetRecommendationUseCase {
  final GetRecRepo _repo;
  GetRecommendationUseCase (this._repo);

  Future<List<Recommendations>> call (RecommendationInput input) {
    return _repo.getRecommendations(input);
  }

}