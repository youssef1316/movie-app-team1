import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/config/app_config.dart';
import '../../domain/entities/recommendations.dart';
import '../model/rec_model.dart';

abstract class GeminiRemoteDataSource {
  Future<List<Recommendations>> generateRecommendations({
    required String userInput,
    int maxResults,
  });
}

@LazySingleton(as: GeminiRemoteDataSource)
class GeminiRemoteDataSourceImpl implements GeminiRemoteDataSource {
  final GenerativeModel _model;

  // private constructor so injectable doesn't try to inject GenerativeModel
  GeminiRemoteDataSourceImpl._(this._model);

  @factoryMethod
  factory GeminiRemoteDataSourceImpl.fromConfig() {
    final api = AppConfig.geminiApiKey;
    if (api.isEmpty) throw StateError("Missing api key!");

    return GeminiRemoteDataSourceImpl._(
      GenerativeModel(
        model: AppConfig.geminiModel,
        apiKey: api,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          maxOutputTokens: 1024,
        ),
      ),
    );
  }

  @override
  Future<List<Recommendations>> generateRecommendations({
    required String userInput,
    int maxResults = 10,
  }) async {
    final prompt =
        '''
suggest $maxResults $userInput movies sorted by rating.
Return ONLY a valid JSON array of objects.
 IMPORTANT: All values must be valid JSON strings on a single line (no line breaks inside strings).
Each object must have:
- "title"
- "genre"
- "id"
- "voteAverage"
- "posterPath"
- "runtime"
- "releaseDate"

Format:
[
  {
    "title": "Movie Title",
    "genre": "Action",
    "id: 123,
    "voteAverage":4.5,
     "posterPath":"poster of movie",
     "runtime":128,
     "releaseDate":"2005-06-6"
  }
]
If no such movies exist, return an empty array [].
''';

    final response = await _model.generateContent([Content.text(prompt)]);
    final text = response.text;

    if (text == null || text.trim().isEmpty) {
      throw Exception("Gemini returned empty response");
    }

    final parsed = _tryParseJsonArray(text);
    if (parsed != null) {
      return parsed
          .map((e) => RecommendationModel.fromJson(e).toEntity())
          .toList();
    }

    // fallback: turn lines into Recommendations
    return text
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .map((l) => Recommendations(title: l.trim()))
        .take(maxResults)
        .toList();
  }

  List<Map<String, dynamic>>? _tryParseJsonArray(String raw) {
    try {
      // remove ```json fences or other markdown
      final clean = raw.replaceAll(RegExp(r'```json|```'), '').trim();

      // extract only the JSON array
      final match = RegExp(r'\[.*\]', dotAll: true).firstMatch(clean);
      if (match != null) {
        final decoded = jsonDecode(match.group(0)!);
        if (decoded is List) {
          return decoded.map((e) => Map<String, dynamic>.from(e)).toList();
        }
      }
    } catch (e) {
      print("JSON parse error: $e\nRaw: $raw");
    }
    return null;
  }
}
