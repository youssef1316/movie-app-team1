import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';

import '../../features/home/domain/entities/movie.dart';
import '../navigation/routes_manager/routes.dart';


class TopFiveCard extends StatelessWidget {
  final String numberTag;
  final Movie movie;

  const TopFiveCard({super.key, required this.movie, required this.numberTag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.movieDetailRoute,
        arguments: movie,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,

        children: [
          Container(
            width: AppDimensions.topFiveCardWidth(context),
            height: AppDimensions.topFiveCardHeight(context),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Text(
            numberTag,
            style: TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: AppColors.white,
              fontSize: 96,
              fontWeight: FontWeight.bold,
              height: 0.75,
            ),
          ),
        ],
      ),
    );
  }
}
