import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/core/navigation/routes_manager/routes.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_event.dart';
import 'package:movie_cellula/features/detail/presentation/bloc/detail_state.dart';
import 'package:movie_cellula/features/search/presentation/widgets/movie_info_widget.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../detail/domian/entites/genre.dart';

class SearchMovieWidget extends StatelessWidget {
  final int movieId;
  const SearchMovieWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return BlocProvider(
      create: (context) =>
          MovieDetailsBloc(getIt())..add(GetMovieDetailsEvent(movieId)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccessState) {
            final movie = state.movieDetails;
            return InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.movieDetailRoute,arguments: movieId);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppConstants.imageBaseUrl}/${movie.posterPath}",
                        height: height * 0.16,
                        width: width * 0.28,
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white70,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    SizedBox(
                      width: width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: height * 0.01),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                SvgsManager.rateSvg,
                                width: width * 0.05,
                              ),
                              Text(
                                movie.voteAverage!.toStringAsFixed(1),
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          MovieInfoWidget(
                            text: safeGenre(movie.genres) ?? "",
                            asset: SvgsManager.genreSvg,
                          ),
                          MovieInfoWidget(
                            text: extractYear(movie.releaseDate),
                            asset: SvgsManager.calendarSvg,
                          ),
                          MovieInfoWidget(
                            text: "${movie.runtime.toString()} min",
                            asset: SvgsManager.clockSvg,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          if (state is MovieDetailsErrorState) {
            return Text(state.errorMessage ?? "");
          }
          if (state is MovieDetailsLoadingState) {
            return SizedBox();
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}

String extractYear(String? movieDate) {
  String dateString = movieDate ?? "";
  try {
    if (dateString.isEmpty) return "Unknown";
    DateTime date = DateTime.parse(dateString);
    return date.year.toString();
  } catch (e) {
    return "Unknown";
  }
}

String? safeGenre(List<Genre>? genres) {
  if (genres == null || genres.isEmpty) return "Unknown";
  return genres.length > 1 ? genres[1].name : genres.first.name;
}
