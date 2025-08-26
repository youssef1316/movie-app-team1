import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';

import '../../../../../core/utils/app_constants.dart';

class CastWidget extends StatelessWidget {
  final String? imagePath;
  final String? actorName;
  const CastWidget({super.key, required this.imagePath, required this.actorName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl:
            "${AppConstants.imageBaseUrl}$imagePath",
            width: width * 0.22,
            height: height * 0.12,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) =>
                Icon(Icons.error),
          ),
        ),
        Text(actorName??"",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          style: TextStyle(color: AppColors.white),)
      ],
    );
  }
}
