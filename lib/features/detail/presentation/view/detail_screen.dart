import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/core/utils/app_constants.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_event.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/movie_tab_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/rate_widget.dart';
import 'package:movie_cellula/features/search/presentation/widgets/search_movie_widget.dart';
import 'package:movie_cellula/features/watchList/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_cellula/features/watchList/presentation/bloc/watch_list_event.dart'
    as event;
import 'package:movie_cellula/features/watchList/domain/entities/movie.dart';

import '../bloc/detail_state.dart';

class DetailScreen extends StatelessWidget {
  final int? movieId;

  const DetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return DefaultTabController(
      length: 2, // Number of tabs in MovieTabSection
      child: BlocProvider(
        create: (context) =>
            MovieDetailsBloc(getIt())..add(GetMovieDetailsEvent(movieId)),
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccessState) {
              final movieDetails = state.movieDetails;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColors.mainColor,
                  title: Text(
                    'Detail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: Image.asset(
                        IconsManager.saveIcon,
                        color: Colors.white,
                        width: width * 0.06,
                      ),
                      onPressed: () {
                        BlocProvider.of<WatchlistBloc>(context).add(
                          event.AddMovie(
                            WishListMovie(
                              title: movieDetails.title ?? "No title",
                              rating: movieDetails.voteAverage ?? 0.0,
                              year: extractYear(movieDetails.releaseDate),
                              duration: movieDetails.runtime != null
                                  ? "${movieDetails.runtime} minutes"
                                  : "Unknown",
                              poster: movieDetails.posterPath ?? "",
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                backgroundColor: AppColors.mainColor,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.025),
                      // Poster Stack
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Cover image
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppConstants.imageBaseUrl}${movieDetails.backdropPath}",
                              width: double.infinity,
                              height: height * 0.3,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),

                          // Small image
                          Positioned(
                            top: height * 0.22,
                            left: width * 0.05,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppConstants.imageBaseUrl}${movieDetails.posterPath}",
                                    width: width * 0.25,
                                    height: height * 0.16,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                SizedBox(
                                  width: width * 0.6,
                                  height: height * 0.13,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      movieDetails.title ?? "No title",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // movie rate
                          Positioned(
                            right: width * 0.03,
                            top: height * 0.26,
                            child: RateWidget(
                              rate: movieDetails.voteAverage!.toStringAsFixed(
                                1,
                              ),
                            ),
                          ),

                          // Title and release date
                        ],
                      ),

                      SizedBox(height: height * 0.09),
                      // Movie info row (date, runtime, genre)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Calendar
                            Row(
                              children: [
                                Image.asset(
                                  IconsManager.calenderIcon,
                                  width: width * 0.05,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  extractYear(movieDetails.releaseDate),
                                  style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            Image.asset(
                              IconsManager.vector,
                              width: width * 0.015,
                            ),

                            // Runtime
                            Row(
                              children: [
                                Image.asset(
                                  IconsManager.clockIcon,
                                  width: width * 0.05,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  movieDetails.runtime != null
                                      ? "${movieDetails.runtime} minutes"
                                      : "Unknown",
                                  style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            Image.asset(
                              IconsManager.vector,
                              width: width * 0.015,
                            ),

                            // Genre
                            Row(
                              children: [
                                Image.asset(
                                  IconsManager.ticketIcon,
                                  width: width * 0.05,
                                ),
                                const SizedBox(width: 4),
                                 Text(
                                  movieDetails.genres?[1].name??"",
                                  style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: height * 0.01),

                      // Tabs section
                      MovieTabSection(movieDetails: movieDetails),
                    ],
                  ),
                ),
              );
            }
            if (state is MovieDetailsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is MovieDetailsErrorState) {
              return Center(child: Text(state.errorMessage ?? ""));
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
