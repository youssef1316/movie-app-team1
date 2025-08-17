import '../repos/watchlistrepo.dart';

class RemoveFromWatchlist{
  final WatchListRepo repo;
  RemoveFromWatchlist(this.repo);

  Future<void> call(String movieName) => repo.remove(movieName);
}