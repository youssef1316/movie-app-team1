import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/movie.dart';
sealed class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}
class EmptyListState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Movie> searchedMovies;
  SearchLoadedState(this.searchedMovies);
  @override
  List<Object?> get props => [searchedMovies];
}

class SearchErrorState extends SearchState {
  final String? message;
  SearchErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
