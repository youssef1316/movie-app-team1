import '../entities/movie.dart';
abstract class WatchListRepo {
  Future<List<WishListMovie>> getWatchList();
  Future<void> add (WishListMovie movie);
  Future<void> remove (String movieName);
  Future<void> clear ();
}