// lib/features/watchlist/presentation/bloc/watchlist_state.dart
import '../../domain/entities/movie.dart';

abstract class WatchlistState {
  const WatchlistState();
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<Movie> movies;
  const WatchlistLoaded(this.movies);
}

class WatchlistError extends WatchlistState {
  final String message;
  const WatchlistError(this.message);
}