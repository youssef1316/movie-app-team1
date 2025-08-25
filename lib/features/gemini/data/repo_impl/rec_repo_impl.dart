import 'package:injectable/injectable.dart';

import '../../domain/entities/recommendations.dart';
import '../../domain/repo/recommendation_repo.dart';
import '../remote_datasource/remote_datasource.dart';

@Injectable(as: GetRecRepo)
class GetRecRepoImpl implements GetRecRepo {
  final GeminiRemoteDataSource remote;

  GetRecRepoImpl(this.remote);

  @override
  Future<List<Recommendations>> getRecommendations(
    RecommendationInput input,
  ) async {
    final results = await remote.generateRecommendations(
      userInput: input.userInput,
      maxResults: input.maxResults,
    );

    return results;
  }
}
