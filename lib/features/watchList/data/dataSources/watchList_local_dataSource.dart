import 'dart:convert';
import 'package:movie_cellula/features/watchList/data/model/watchList_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WatchlistLocalDataSource {
  Future<List<WatchListMovieModel>> getWatchList();
  Future<void> saveAll(List<WatchListMovieModel> movies);
}

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  static const _key = 'Watchlist_movies';
  @override
  Future<List<WatchListMovieModel>> getWatchList() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? <String>[];

    return list
        .map((s) => WatchListMovieModel.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList(growable: false);
  }

  @override
  Future<void> saveAll(List<WatchListMovieModel> movies) async {
    final pref = await SharedPreferences.getInstance();
    final list = movies.map((m) => jsonEncode(m.toJson())).toList(growable: false);
    await pref.setStringList(_key, list);
  }
}