import 'package:equatable/equatable.dart';


abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
  @override
  List<Object?> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailEvent {
final int? movieId;
  const GetMovieDetailsEvent(this.movieId);
}
