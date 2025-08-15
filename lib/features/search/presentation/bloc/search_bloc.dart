import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/search/domain/usecase/search-usecase.dart';
import 'package:movie_cellula/features/search/presentation/bloc/search_event.dart';
import 'package:movie_cellula/features/search/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMoviesUseCase useCase;
  SearchBloc(this.useCase) : super(SearchInitialState()) {
    on<GetSearchedMovies>(getSearchedMovies);
    on<ResetSearch>((event, emit) => emit(SearchInitialState()));
  }

  Future<void> getSearchedMovies(
    GetSearchedMovies event,
    Emitter<SearchState> emit,
  ) async {
    if (event.movieName.trim().isEmpty) {
      emit(SearchInitialState());
      return;
    }
    emit(SearchLoadingState());
    try {
      final result = await useCase.searchMovie(
        event.movieName
      );

      result.fold((ifLeft) => emit(SearchErrorState(ifLeft)), (ifRight) {
        final moviesList = ifRight ?? [];
        if (moviesList.isNotEmpty) {
          emit(SearchLoadedState(moviesList));
        } else {
          emit(EmptyListState());
        }
      });
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
