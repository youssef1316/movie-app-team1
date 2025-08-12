import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/home/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_cellula/features/home/domain/usecase/get_popular_movies.dart';
import 'package:movie_cellula/features/home/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_cellula/features/home/domain/usecase/get_trend_movies.dart';
import 'package:movie_cellula/features/home/domain/usecase/get_upcoming_movies.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopRatedMoviesUseCase topRatedMovies;
  final NowPlayingMoviesUseCase nowPlayingMovies;
  final GetPopularMoviesUseCase popularMovies;
  final GetUpcomingMoviesUseCase upcomingMovies;
  final GetTrendMoviesUseCase trendMovies;

  HomeBloc({
    required this.topRatedMovies,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.upcomingMovies,
    required this.trendMovies,
  }) : super(HomeInitial()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(
      FetchHomeData event,
      Emitter<HomeState> emit,
      ) async {
    emit(HomeLoading());

    try {
      final results = await Future.wait([
        topRatedMovies.invoke(),
        nowPlayingMovies.invoke(),
        popularMovies.invoke(),
        upcomingMovies.invoke(),
        trendMovies.invoke(),
      ]);

      for (var result in results) {
        if (result.isLeft()) {
          emit(HomeError(message: result.swap().getOrElse(() => 'Unknown error')));
          return;
        }
      }
      final topRatedMoviesList = results[0].getOrElse(() => []);
      final nowPlayingMoviesList = results[1].getOrElse(() => []);
      final popularMoviesList = results[2].getOrElse(() => []);
      final upcomingMoviesList = results[3].getOrElse(() => []);
      final trendMoviesList = results[4].getOrElse(() => []);

      emit(HomeLoaded(
        topRatedMovies: topRatedMoviesList!,
        nowPlayingMovies: nowPlayingMoviesList!,
        popularMovies: popularMoviesList!,
        upcomingMovies: upcomingMoviesList!,
        trendMovies: trendMoviesList!,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}