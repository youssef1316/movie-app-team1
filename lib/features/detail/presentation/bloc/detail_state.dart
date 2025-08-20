import 'package:equatable/equatable.dart';
import 'package:movie_cellula/features/detail/domian/entites/movie_details.dart';

abstract class MovieDetailsState extends Equatable{
  @override
  List<Object?> get props => [];
}

class MovieDetailsInitialState extends MovieDetailsState{}
class MovieDetailsLoadingState extends MovieDetailsState{}
class MovieDetailsErrorState extends MovieDetailsState{
  final String? errorMessage;
  MovieDetailsErrorState(this.errorMessage);
}
class MovieDetailsSuccessState extends MovieDetailsState{
  final MovieDetails movieDetails;
  MovieDetailsSuccessState(this.movieDetails);
}