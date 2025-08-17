import '../entities/movie.dart';
import '../repos/watchlistrepo.dart';

class AddToWatchList {
  final WatchListRepo repo;
  AddToWatchList(this.repo);

  Future<void> call (Movie movie) => repo.add(movie);
}