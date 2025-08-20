import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/movie_tab_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_cellula/features/watchList/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_cellula/features/watchList/presentation/bloc/watch_list_event.dart' as event;
import 'package:movie_cellula/features/watchList/domain/entities/movie.dart';
import 'package:movie_cellula/core/navigation/bottom_nav_bar_routes.dart';

class DetailScreen extends StatelessWidget {
  final String coverImage;
  final String smallImage;
  final String rate;
  final String? title;
  final String? releasedate;
  final int? runtime;
  final String? overview;

  const DetailScreen({
    super.key,
    required this.coverImage,
    required this.smallImage,
    required this.rate,
    required this.title,
    required this.releasedate,
    required this.runtime,
    required this.overview
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return DefaultTabController(
      length: 2, // Number of tabs in MovieTabSection
      child: Scaffold(
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
                    Movie(
                      title: title ?? "No title",
                      rating: double.tryParse(rate) ?? 0.0,
                      year: releasedate ?? "Unknown",
                      duration: runtime != null ? "$runtime minutes" : "Unknown",
                      poster: coverImage,
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
                  Image.network(
                    coverImage,
                    width: double.infinity,
                    height: height * 0.3,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity,
                      height: height * 0.3,
                      color: Colors.grey.shade800,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.white70, size: 40),
                      ),
                    ),
                  ),

                  // Small image
                  Positioned(
                    left: width * 0.07,
                    top: height * 0.22,
                    child: Image.network(
                      smallImage,
                      width: width * 0.25,
                      height: height * 0.15,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: width * 0.25,
                        height: height * 0.15,
                        color: Colors.grey.shade800,
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.white70, size: 40),
                        ),
                      ),
                    ),
                  ),
                  // Rate image
                  Positioned(
                    right: width * 0.03,
                    top: height * 0.31,
                    child: SvgPicture.asset(
                      "assets/svgs/rate.svg",
                      width: width * 0.2,
                      height: height * 0.035,
                    ),
                  ),

                  // Title and release date
                  Positioned(
                    right: width * 0.23,
                    top: height * 0.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? "No title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (releasedate != null)
                          Text(
                            releasedate!,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  ),
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
                        Image.asset(IconsManager.calenderIcon, width: width * 0.05),
                        const SizedBox(width: 4),
                        Text(
                          releasedate ?? "Unknown",
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Image.asset(IconsManager.vector, width: width * 0.015),

                    // Runtime
                    Row(
                      children: [
                        Image.asset(IconsManager.clockIcon, width: width * 0.05),
                        const SizedBox(width: 4),
                        Text(
                          runtime != null ? "$runtime minutes" : "Unknown",
                          style: TextStyle(
                            color: AppColors.lightGrey,
                            fontSize: width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Image.asset(IconsManager.vector, width: width * 0.015),

                    // Genre
                    Row(
                      children: [
                        Image.asset(IconsManager.ticketIcon, width: width * 0.05),
                        const SizedBox(width: 4),
                        const Text(
                          "Genre",
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
              MovieTabSection(overview: overview),
            ],
          ),
        ),
      ),
    );
  }
}
