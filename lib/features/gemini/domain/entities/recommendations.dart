import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String title;
  final String? overview;

  const Recommendations({
    required this.title,
    this.overview,
  });

  @override
  List<Object?> get props => [title, overview];
}

class RecommendationInput extends Equatable {
  final String recGenre;
  final int maxResults;

  const RecommendationInput({
    required this.recGenre,
    this.maxResults = 10,
  });

  @override
  List<Object?> get props => [recGenre, maxResults];
}