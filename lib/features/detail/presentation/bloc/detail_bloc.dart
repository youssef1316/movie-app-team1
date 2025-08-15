import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_event.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_state.dart';
import 'package:movie_cellula/features/detail/domian/usecsae/get_movie_details.dart';

class MovieDetailsBloc extends Bloc<MovieDetailEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase useCase;
  MovieDetailsBloc(this.useCase) : super(MovieDetailsInitialState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
  }

  Future<void> getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsInitialState());
    try {
      emit(MovieDetailsLoadingState());
      final result = await useCase.invoke(event.movieId);
      result.fold(
        (l) => emit(MovieDetailsErrorState(l)),
        (r) => emit(MovieDetailsSuccessState(r)),
      );
    } catch (e) {
      emit(MovieDetailsErrorState(e.toString()));
    }
  }
}
