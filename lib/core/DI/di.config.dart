// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/dataSource/movie_data_source.dart' as _i1021;
import '../../features/home/data/repositoryImp/movie_repo_imp.dart' as _i336;
import '../../features/home/domain/repository/movie_repo.dart' as _i372;
import '../../features/home/domain/usecase/get_movie_details.dart' as _i384;
import '../../features/home/domain/usecase/get_now_playing_movies.dart' as _i62;
import '../../features/home/domain/usecase/get_popular_movies.dart' as _i1041;
import '../../features/home/domain/usecase/get_top_rated_movies.dart' as _i617;
import '../../features/home/domain/usecase/get_trend_movies.dart' as _i98;
import '../../features/home/domain/usecase/get_upcoming_movies.dart' as _i430;
import '../api/api_manager.dart' as _i442;

import '../../features/home/presentation/bloc/home_bloc.dart' as _i999;

import '../../features/watchList/data/dataSources/watchList_local_dataSource.dart' as _i1042;
import '../../features/watchList/data/repo_impl/watch_list_repo.dart' as _i1043;
import '../../features/watchList/domain/repos/watchlistrepo.dart' as _i1044;
import '../../features/watchList/domain/usecases/get_watchlist.dart' as _i1045;
import '../../features/watchList/domain/usecases/add_to_watchlist.dart' as _i1046;
import '../../features/watchList/domain/usecases/remove_from_watchlist.dart' as _i1047;
import '../../features/watchList/domain/usecases/clear_watchlist.dart' as _i1048;
import '../../features/watchList/presentation/bloc/watchlist_bloc.dart' as _i1049;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.factory<_i1021.BaseMovieDataSource>(
          () => _i1021.MovieDataSource(gh<_i442.ApiManager>()),
    );
    gh.factory<_i372.BaseMovieRepository>(
          () => _i336.MovieRepository(gh<_i1021.BaseMovieDataSource>()),
    );
    gh.factory<_i617.GetTopRatedMoviesUseCase>(
          () => _i617.GetTopRatedMoviesUseCase(gh<_i372.BaseMovieRepository>()),
    );
    gh.factory<_i98.GetTrendMoviesUseCase>(
          () => _i98.GetTrendMoviesUseCase(gh<_i372.BaseMovieRepository>()),
    );
    gh.factory<_i62.NowPlayingMoviesUseCase>(
          () => _i62.NowPlayingMoviesUseCase(gh<_i372.BaseMovieRepository>()),
    );
    gh.factory<_i430.GetUpcomingMoviesUseCase>(
          () => _i430.GetUpcomingMoviesUseCase(gh<_i372.BaseMovieRepository>()),
    );
    gh.factory<_i1041.GetPopularMoviesUseCase>(
          () => _i1041.GetPopularMoviesUseCase(gh<_i372.BaseMovieRepository>()),
    );
    gh.factory<_i384.GetMovieDetailsUseCase>(
          () => _i384.GetMovieDetailsUseCase(gh<_i372.BaseMovieRepository>()),
    );

    gh.factory<_i999.HomeBloc>(() => _i999.HomeBloc(
      topRatedMovies: gh<_i617.GetTopRatedMoviesUseCase>(),
      nowPlayingMovies: gh<_i62.NowPlayingMoviesUseCase>(),
      popularMovies: gh<_i1041.GetPopularMoviesUseCase>(),
      upcomingMovies: gh<_i430.GetUpcomingMoviesUseCase>(),
      trendMovies: gh<_i98.GetTrendMoviesUseCase>(),
    ));

    gh.factory<_i1042.WatchlistLocalDataSource>(
          () => _i1042.WatchlistLocalDataSourceImpl(),
    );
    gh.factory<_i1044.WatchListRepo>(
          () => _i1043.WatchlistRepositoryImpls(gh<_i1042.WatchlistLocalDataSource>()),
    );
    gh.factory<_i1045.GetWatchList>(
          () => _i1045.GetWatchList(gh<_i1044.WatchListRepo>()),
    );
    gh.factory<_i1046.AddToWatchList>(
          () => _i1046.AddToWatchList(gh<_i1044.WatchListRepo>()),
    );
    gh.factory<_i1047.RemoveFromWatchlist>(
          () => _i1047.RemoveFromWatchlist(gh<_i1044.WatchListRepo>()),
    );
    gh.factory<_i1048.ClearWatchlist>(
          () => _i1048.ClearWatchlist(gh<_i1044.WatchListRepo>()),
    );

    gh.factory<_i1049.WatchlistBloc>(() => _i1049.WatchlistBloc(
      getWatchlist: gh<_i1045.GetWatchList>(),
      addToWatchlist: gh<_i1046.AddToWatchList>(),
      removeFromWatchlist: gh<_i1047.RemoveFromWatchlist>(),
      clearWatchlist: gh<_i1048.ClearWatchlist>(),
    ));

    return this;
  }
}