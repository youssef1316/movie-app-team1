import '../repos/watchlistrepo.dart';

class ClearWatchlist {
  final WatchListRepo repo;
  ClearWatchlist(this.repo);
  Future<void> call() => repo.clear();
}