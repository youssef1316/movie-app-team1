import'../../domain/entities/recommendations.dart';
import '../../domain/repo/recommendation_repo.dart';
import '../remote_datasource/remote_datasource.dart';

class GetRecRepoImpl implements GetRecRepo {
  final GeminiRemoteDataSource remote;

  GetRecRepoImpl(this.remote);

  @override
  Future<List<Recommendations>> getRecommendations(RecommendationInput input) {
   return remote.genreateRecommendations(
       recGenre: input.recGenre,
       maxResults: input.maxResults
   );
  }
}