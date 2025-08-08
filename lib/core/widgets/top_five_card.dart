import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/app_constants.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';
import 'package:movie_cellula/domain/entities/movie.dart';

class TopFiveCard extends StatelessWidget {

  final String numberTag;
  final Movie movie;
  final void Function()? onTap;

  const TopFiveCard({
    super.key,
    required this.movie,
    required this.numberTag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
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
