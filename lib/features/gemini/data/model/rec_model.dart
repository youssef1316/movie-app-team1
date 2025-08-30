import '../../domain/entities/recommendations.dart';

class RecommendationModel {
  final String title;
  final String? genre;
  final int? id;
  final double? voteAverage;
  final String? releaseDate;
  final int? runtime;
  final String? posterPath;

  RecommendationModel({
    required this.title,

    this.genre,
    this.id,
    this.voteAverage,
    this.posterPath,
    this.runtime,
    this.releaseDate,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      title: json['title'] as String,

      posterPath: json['posterPath'] as String,
      releaseDate: json['releaseDate'] as String,
      genre: json['genre'] as String,
      voteAverage: (json['voteAverage'] is int)
          ? (json['voteAverage'] as int).toDouble()
          : (json['voteAverage'] ?? 0).toDouble(),

      id: _parseId(json['id']),
      runtime: _parseId(json['runtime']),
    );
  }
  static int? _parseId(dynamic raw) {
    if (raw == null) return null;
    if (raw is int) return raw;
    if (raw is String) {
      return int.tryParse(raw);
    }
    return null;
  }

  Recommendations toEntity() => Recommendations(
    title: title,
    genre: genre,
    id: id,
    voteAverage: voteAverage,
    runtime: runtime,
    posterPath: posterPath,
    releaseDate: releaseDate,
  );
}
