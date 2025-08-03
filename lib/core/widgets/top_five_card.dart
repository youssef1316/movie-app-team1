import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';

class TopFiveCard extends StatelessWidget {
  final String imageUrl;
  final String numberTag;
  final void Function()? onTap;

  const TopFiveCard({
    super.key,
    required this.imageUrl,
    required this.numberTag,
    required this.onTap
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
           // Please add image child below after integrate api
           // child: Image.network(imageUrl),
          ),
          Text(
            numberTag,
            style: TextStyle(
              fontFamily: AppStrings.fontFamily,
              color: AppColors.black,
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
