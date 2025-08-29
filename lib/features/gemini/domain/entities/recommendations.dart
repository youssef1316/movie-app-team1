import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String title;
  final String? genre;
  final int? id;
  final double? voteAverage;
  final String? releaseDate;
  final int? runtime;
  final String? posterPath;

  const Recommendations({
    required this.title,
    this.genre,
    this.id,
    this.voteAverage,
    this.releaseDate,
    this.posterPath,
    this.runtime,
  });

  @override
  List<Object?> get props => [
    title,
    releaseDate,
    runtime,
    posterPath,
    genre,
    id,
    voteAverage,
  ];
}

class RecommendationInput extends Equatable {
  final String userInput;
  final int maxResults;

  const RecommendationInput({required this.userInput, this.maxResults = 10});

  @override
  List<Object?> get props => [userInput, maxResults];
}
