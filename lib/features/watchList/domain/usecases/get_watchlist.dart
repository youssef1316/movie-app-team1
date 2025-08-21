import '../repos/watchlistrepo.dart';
import '../entities/movie.dart';

class GetWatchList{
  final WatchListRepo repo;
  GetWatchList(this.repo);
  Future<List<WishListMovie>> call () => repo.getWatchList();
}