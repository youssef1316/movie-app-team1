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

import '../../data/api/api_manager.dart' as _i442;
import '../../data/dataSource/movie_data_source.dart' as _i1021;
import '../../data/repositoryImp/movie_repo_imp.dart' as _i336;
import '../../domain/repository/movie_repo.dart' as _i372;
import '../../domain/usecase/get_movie_details.dart' as _i384;
import '../../domain/usecase/get_now_playing_movies.dart' as _i62;
import '../../domain/usecase/get_popular_movies.dart' as _i1041;
import '../../domain/usecase/get_top_rated_movies.dart' as _i617;
import '../../domain/usecase/get_trend_movies.dart' as _i98;
import '../../domain/usecase/get_upcoming_movies.dart' as _i430;
import '../../features/home/presentation/bloc/home_bloc.dart' as _i999;

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

    return this;
  }
}