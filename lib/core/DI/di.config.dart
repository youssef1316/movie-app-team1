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

import '../../features/detail/domian/usecsae/get_movie_details.dart' as _i1014;
import '../../features/home/data/dataSource/movie_data_source.dart' as _i575;
import '../../features/home/data/repositoryImp/movie_repo_imp.dart' as _i360;
import '../../features/home/domain/repository/movie_repo.dart' as _i868;
import '../../features/home/domain/usecase/get_now_playing_movies.dart'
    as _i248;
import '../../features/home/domain/usecase/get_popular_movies.dart' as _i764;
import '../../features/home/domain/usecase/get_top_rated_movies.dart' as _i236;
import '../../features/home/domain/usecase/get_trend_movies.dart' as _i393;
import '../../features/home/domain/usecase/get_upcoming_movies.dart' as _i474;
import '../../features/search/data/dataSource/search_data_source.dart' as _i316;
import '../../features/search/data/repositoryImp/search_repository_imp.dart'
    as _i796;
import '../../features/search/domain/repository/search_repository.dart'
    as _i535;
import '../../features/search/domain/usecase/search-usecase.dart' as _i637;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i575.BaseMovieDataSource>(
      () => _i575.MovieDataSource(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i316.BaseSearchDataSource>(
      () => _i316.SearchDataSource(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i868.BaseMovieRepository>(
      () => _i360.MovieRepository(gh<_i575.BaseMovieDataSource>()),
    );
    gh.factory<_i1014.GetMovieDetailsUseCase>(
      () => _i1014.GetMovieDetailsUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i248.NowPlayingMoviesUseCase>(
      () => _i248.NowPlayingMoviesUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i764.GetPopularMoviesUseCase>(
      () => _i764.GetPopularMoviesUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i236.GetTopRatedMoviesUseCase>(
      () => _i236.GetTopRatedMoviesUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i393.GetTrendMoviesUseCase>(
      () => _i393.GetTrendMoviesUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i474.GetUpcomingMoviesUseCase>(
      () => _i474.GetUpcomingMoviesUseCase(gh<_i868.BaseMovieRepository>()),
    );
    gh.factory<_i535.BaseSearchRepository>(
      () => _i796.SearchRepository(gh<_i316.BaseSearchDataSource>()),
    );
    gh.factory<_i637.SearchMoviesUseCase>(
      () => _i637.SearchMoviesUseCase(gh<_i535.BaseSearchRepository>()),
    );
    return this;
  }
}
