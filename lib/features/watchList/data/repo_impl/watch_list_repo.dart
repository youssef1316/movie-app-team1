import '../../domain/entities/movie.dart';
import '../../domain/repos/watchlistrepo.dart';
import '../dataSources/watchList_local_dataSource.dart';
import '../model/watchList_model.dart';

class WatchlistRepositoryImpls implements WatchListRepo{
  final WatchlistLocalDataSource local;

  WatchlistRepositoryImpls(this.local);

  Future<List<WatchListMovieModel>> _fetchModels() async => await local.getWatchList();
  Future<void> _persist(List<WatchListMovieModel> models) => local.saveAll(models);

  @override
  Future<void> add(WishListMovie movie) async {
   final models = await _fetchModels();
   final exists = models.any((m) => m.title == movie.title);
   if(!exists) {
     final updated = List<WatchListMovieModel>.from(models) ..add(
       WatchListMovieModel.fromEntity(movie)
     );
     await _persist(updated);
   }
  }

  @override
  Future<void> clear() async {
    await _persist(const <WatchListMovieModel>[]);
  }

  @override
  Future<List<WishListMovie>> getWatchList() async {
    final models = await _fetchModels();
    return models.map((m) => m.toEntity()) .toList(growable: false);
  }

  @override
  Future<void> remove(String movieName) async {
    final models = await _fetchModels();
    final updated = models.where((m) => m.title != movieName).toList();
    await _persist(updated);
  }

}