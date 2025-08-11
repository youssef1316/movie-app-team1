import 'package:flutter/cupertino.dart';
import 'package:movie_cellula/features/home/presentation/view/home_screen.dart';
import 'package:movie_cellula/features/search/presentation/search_screen.dart';
import 'package:movie_cellula/features/watchList/presentation/watchList_screen.dart';

abstract class BottomNavBarRoutes {
  static List<Widget> routes = [
    HomeScreen(),
    SearchScreen(),
    WatchlistScreen(),
  ];
}
