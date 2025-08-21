import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/entities/recommendations.dart';
import '../model/rec_model.dart';

abstract class GeminiRemoteDataSource {
  Future<List<Recommendations>> genreateRecommendations({
    required String recGenre,
    int maxResults,
  });
}

class GeminiRemoteDataSourceImpl implements GeminiRemoteDataSource {
  final GenerativeModel model;
  GeminiRemoteDataSourceImpl({required this.model});

  factory GeminiRemoteDataSourceImpl.fromConfig () {
    final api = AppConfig.geminiApiKey;
    if (api.isEmpty) throw StateError("Missing api key!");

    return GeminiRemoteDataSourceImpl(
      model: GenerativeModel(
        model: AppConfig.geminiModel,
        apiKey: api,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          maxOutputTokens: 1024
        )
      )
    );
  }
  @override
  Future<List<Recommendations>> genreateRecommendations({
    required String recGenre,
    int maxResults = 10}) async {
      final prompt = '''
      Suggest $maxResults $recGenre from TMDB api movies and sort them according to the rating.
      Return only a json array with objects {'title': string, 'overview': string?}.
      Only output the JSON map.
      ''';

      final response = await model.generateContent([Content.text(prompt)]);
      final text = response.text ?? 'Error in getting response';

      final parsed = _tryParseJsonArray(text);
      if (parsed != null) {
        return parsed
            .map ((e) => RecommendationModel.fromJson(e).toEntity())
            .toList();
      }
      return text
          .split('\n')
          .where((l) => l.trim().isNotEmpty)
          .map((l) => Recommendations(title: l.trim()))
          .take(maxResults)
          .toList();
  }
  List<Map<String, dynamic>>? _tryParseJsonArray(String raw) {
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List)
        return decoded.cast<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
    }catch (e) {}
    return null;
  }
}
