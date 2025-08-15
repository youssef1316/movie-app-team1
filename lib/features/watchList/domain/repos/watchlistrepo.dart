import '../entities/movie.dart';
abstract class WatchListRepo {
  Future<List<Movie>> getWatchList();
  Future<void> add (Movie movie);
  Future<void> remove (String movieName);
  Future<void> clear ();
}