import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/add_to_watchlist.dart';
import '../../domain/usecases/clear_watchlist.dart';
import '../../domain/usecases/get_watchlist.dart';
import '../../domain/usecases/remove_from_watchlist.dart';
import 'watch_list_event.dart' as watchlist_event;
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<watchlist_event.WatchlistEvent, WatchlistState> {
  final GetWatchList getWatchlist;
  final AddToWatchList addToWatchlist;
  final RemoveFromWatchlist removeFromWatchlist;
  final ClearWatchlist clearWatchlist;

  WatchlistBloc({
    required this.getWatchlist,
    required this.addToWatchlist,
    required this.removeFromWatchlist,
    required this.clearWatchlist,
  }) : super(WatchlistInitial()) {
    on<watchlist_event.LoadWatchlist>(_onLoad);
    on<watchlist_event.AddMovie>(_onAdd);
    on<watchlist_event.RemoveMovie>(_onRemove);
    on<watchlist_event.ClearWatchlist>(_onClear);
  }

  Future<void> _onLoad(watchlist_event.LoadWatchlist event, Emitter<WatchlistState> emit) async {
    emit(WatchlistLoading());
    try {
      final movies = await getWatchlist();
      emit(WatchlistLoaded(movies));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  Future<void> _onAdd(watchlist_event.AddMovie event, Emitter<WatchlistState> emit) async {
    await addToWatchlist(event.movie);
    add(watchlist_event.LoadWatchlist());
  }

  Future<void> _onRemove(watchlist_event.RemoveMovie event, Emitter<WatchlistState> emit) async {
    await removeFromWatchlist(event.title);
    add(watchlist_event.LoadWatchlist());
  }

  Future<void> _onClear(watchlist_event.ClearWatchlist event, Emitter<WatchlistState> emit) async {
    await clearWatchlist();
    add(watchlist_event.LoadWatchlist());
  }
}

// on<AddMovie>((event, emit) {
// if (state is WatchlistLoaded) {
// final currentList = List<Movie>.from((state as WatchlistLoaded).movies);
// currentList.add(event.movie);
// emit(WatchlistLoaded(currentList));
// } else {
// emit(WatchlistLoaded([event.movie]));
// }
// });