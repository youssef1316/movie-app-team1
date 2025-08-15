import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../utils/colors_manager.dart';

class MainMovieCard extends StatelessWidget {
  final String imageUrl;
  final void Function()? onTap;

  const MainMovieCard({
    super.key,
    required this.imageUrl,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimensions.mainMovieCardWidth(context),
        height: AppDimensions.mainMovieCardHeight(context),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        // Please add image child below after integrate api
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          )
      ),
    );
  }
}
