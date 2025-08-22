import '../../domain/entities/recommendations.dart';

class RecommendationModel {
  final String title;
  final String? overview;

  RecommendationModel({required this.title, this.overview});

  factory RecommendationModel.fromJson(Map<String, dynamic> json){
    return RecommendationModel(
        title: json['title'] as String,
        overview: json['overview'] as String
    );
  }

  Recommendations toEntity() => Recommendations(
      title: title,
      overview: overview,
  );
}