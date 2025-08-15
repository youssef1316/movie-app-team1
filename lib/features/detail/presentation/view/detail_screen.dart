import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_cellula/core/utils/app_constants.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/movie_tab_section.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/rate_widget.dart';

import '../../../home/domain/entities/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Detail",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Image.asset(
                    IconsManager.saveIcon,
                    color: Colors.white,
                    width: width * 0.06,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.015),
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Movie Cover
                CachedNetworkImage(
                  imageUrl:
                      "${AppConstants.imageBaseUrl}/${movie.backdropPath}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.3,
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
                // Small Photo
                Positioned(
                  left: width * 0.07,
                  top: height * 0.22,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppConstants.imageBaseUrl}/${movie.posterPath}",
                      height: height * 0.16,
                      width: width * 0.25,
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
                ),
                // Rate
                Positioned(
                  right: width * 0.03,
                  top: height * 0.26,
                  child: RateWidget(rate: movie.voteAverage!.toStringAsFixed(1)),
                ),
                //  Movie Name
                Positioned(
                  right: width * 0.23,
                  top: height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? "No title",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (movie.releaseDate != null)
                        Text(
                          movie.releaseDate!,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(IconsManager.calenderIcon, width: width * 0.05),
                  Text(
                    movie.releaseDate ?? "Unknown",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(IconsManager.vector, width: width * 0.015),
                  Image.asset(IconsManager.clockIcon, width: width * 0.05),
                  Text(
                    movie.runtime != null
                        ? "${movie.runtime} minutes"
                        : "Unknown",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(IconsManager.vector, width: width * 0.015),
                  Image.asset(IconsManager.ticketIcon, width: width * 0.05),
                  Text(
                    "Genre",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            MovieTabSection(),
          ],
        ),
      ),
    );
  }
}
