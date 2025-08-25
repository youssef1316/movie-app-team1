import '../../domain/entities/recommendations.dart';

class RecommendationModel {
  final String title;
  final String? overView;
  final String? genre;


  RecommendationModel({required this.title, this.overView, this.genre,});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      title: json['title'] as String,
      overView: json['overview'] as String,
      genre: json['genre'] as String,

    );
  }

  Recommendations toEntity() =>
      Recommendations(title: title, overview: overView, genre: genre,);
}
