import 'package:equatable/equatable.dart';

class Recommendations extends Equatable {
  final String title;
  final String? overview;
  final String? genre;


  const Recommendations({required this.title, this.overview,this.genre,});

  @override
  List<Object?> get props => [title, overview];
}

class RecommendationInput extends Equatable {
  final String userInput;
  final int maxResults;

  const RecommendationInput({required this.userInput, this.maxResults = 10});

  @override
  List<Object?> get props => [userInput, maxResults];
}
