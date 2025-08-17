import 'package:flutter/cupertino.dart';
import 'package:movie_cellula/features/home/presentation/view/home_screen.dart';
import 'package:movie_cellula/features/search/presentation/search_screen.dart';

import 'package:movie_cellula/features/watchList/data/repo_impl/watch_list_repo.dart';
import 'package:movie_cellula/features/watchList/data/dataSources/watchList_local_dataSource.dart';
import 'package:movie_cellula/features/watchList/presentation/view/watch_list_screen.dart';



abstract class BottomNavBarRoutes {
  static final repo = WatchlistRepositoryImpls(
    WatchlistLocalDataSourceImpl(),
  );

  static List<Widget> routes = [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen()
  ];
}
