import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
  @override
  List<Object?> get props => [];
}

class GetSearchedMovies extends SearchEvent {
  final String movieName;
  const GetSearchedMovies(this.movieName);
}
class ResetSearch extends SearchEvent {}
