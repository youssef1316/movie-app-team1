import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/detail/domian/usecsae/get_movie_cast.dart';
import 'package:movie_cellula/features/detail/presentation/cast_bloc/cast_event.dart';
import 'package:movie_cellula/features/detail/presentation/cast_bloc/cast_state.dart';

class MovieCastBloc extends Bloc<CastEvent, CastState> {
  MovieCastUseCase useCase;
  MovieCastBloc(this.useCase) : super(CastLoadingState()) {
    on<GetMovieCastEvent>(getMovieCast);
  }

  Future<void> getMovieCast(
    GetMovieCastEvent event,
    Emitter<CastState> emit,
  ) async {
    try {
      final result = await useCase.invoke(event.movieId);
      result.fold(
        (l) => emit(CastErrorState(l)),
        (r) => emit(CastSuccessState(r)),
      );
    } catch (e) {
      emit(CastErrorState(e.toString()));
    }
  }
}
