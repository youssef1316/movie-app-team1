import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/splash/presentation/splash_screen.dart';
import 'core/DI/di.dart';
import 'core/navigation/routes_manager/routes.dart';
import 'core/navigation/routes_manager/routes_generator.dart';

import 'features/watchList/data/dataSources/watchList_local_dataSource.dart';
import 'features/watchList/data/repo_impl/watch_list_repo.dart';
import 'features/watchList/domain/usecases/add_to_watchlist.dart';
import 'features/watchList/domain/usecases/clear_watchlist.dart';
import 'features/watchList/domain/usecases/get_watchlist.dart';
import 'features/watchList/domain/usecases/remove_from_watchlist.dart';
import 'features/watchList/presentation/bloc/watchlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final repo = WatchlistRepositoryImpls(WatchlistLocalDataSourceImpl());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WatchlistBloc(
            getWatchlist: GetWatchList(repo),
            addToWatchlist: AddToWatchList(repo),
            removeFromWatchlist: RemoveFromWatchlist(repo),
            clearWatchlist: ClearWatchlist(repo),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.lightBlue),
      ),
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
