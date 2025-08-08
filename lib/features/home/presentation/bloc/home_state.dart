import 'package:equatable/equatable.dart';
import 'package:movie_cellula/domain/entities/movie.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState{}

class HomeLoading extends HomeState{}

class HomeLoaded extends HomeState{
  final List <Movie> topRatedMovies;
  final List <Movie> nowPlayingMovies;
  final List <Movie> upcomingMovies;
  final List <Movie> popularMovies;
  final List <Movie> trendMovies;

  HomeLoaded({
    required this.topRatedMovies,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.upcomingMovies,
    required this.trendMovies
});

  @override
  List <Object?> get props => [
    topRatedMovies,
    nowPlayingMovies,
    popularMovies,
    upcomingMovies,
    trendMovies
  ];
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}