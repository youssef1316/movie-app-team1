import 'package:flutter/material.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../../domain/entities/movie.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/watch_list_event.dart' as event;
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_state.dart';
import 'package:movie_cellula/features/watchList/data/dataSources/watchList_local_dataSource.dart';
import '../../data/repo_impl/watch_list_repo.dart';
import '../../domain/usecases/add_to_watchlist.dart';
import '../../domain/usecases/clear_watchlist.dart' as useCase;
import '../../domain/usecases/get_watchlist.dart';
import '../../domain/usecases/remove_from_watchlist.dart';
import 'package:movie_cellula/core/navigation/bottom_nav_bar_routes.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final repository = WatchlistRepositoryImpls(WatchlistLocalDataSourceImpl());

    return BlocProvider(
      create: (context) => WatchlistBloc(
        getWatchlist: GetWatchList(repository),
        addToWatchlist: AddToWatchList(repository),
        removeFromWatchlist: RemoveFromWatchlist(repository),
        clearWatchlist: useCase.ClearWatchlist(repository),
      )..add(event.LoadWatchlist()),
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          title: const Text(
            "Watch list",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => BottomNavBarRoutes.routes[0]),
            ),
          ),
        ),
        body: BlocBuilder<WatchlistBloc, WatchlistState>(
          builder: (context, state) {
            if (state is WatchlistLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is WatchlistLoaded) {
              final movies = state.movies;
              return ListView.separated(
                padding: EdgeInsets.all(screenWidth * 0.04),
                itemCount: movies.length,
                separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.015),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return _WatchlistMovieRow(
                    movie: movie,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  );
                },
              );
            } else if (state is WatchlistError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class _WatchlistMovieRow extends StatelessWidget {
  final Movie movie;
  final double screenWidth;
  final double screenHeight;

  const _WatchlistMovieRow({
    required this.movie,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          child: Image.network(
            movie.poster,
            width: screenWidth * 0.22,
            height: screenHeight * 0.14,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: screenWidth * 0.22,
              height: screenHeight * 0.14,
              color: Colors.grey.shade800,
              child: const Icon(
                Icons.broken_image,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.03),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    movie.rating.toString(),
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.005),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white70,
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    movie.year,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.white70,
                    size: screenWidth * 0.04,
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Text(
                    movie.duration,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.delete, color: Colors.red, size:screenWidth*0.06),
          onPressed: (){
          BlocProvider.of<WatchlistBloc>(context).add(event.RemoveMovie(movie.title));
          },
        )
      ],
    );
  }
}
