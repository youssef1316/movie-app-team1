import '../../domain/entities/movie.dart';

abstract class WatchlistEvent {}

class LoadWatchlist extends WatchlistEvent {}

class AddMovie extends WatchlistEvent {
  final WishListMovie movie;
  AddMovie(this.movie);
}

class RemoveMovie extends WatchlistEvent {
  final String title;
  RemoveMovie(this.title);
}

class ClearWatchlist extends WatchlistEvent {}