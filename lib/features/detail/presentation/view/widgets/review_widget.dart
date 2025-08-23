import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/domian/entites/review.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;
  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final authorName =
        (review.authorDetails?.name == null ||
            review.authorDetails!.name!.isEmpty)
        ? "Unknown"
        : review.authorDetails!.name!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.05,
                ),
                width: width * 0.14,
                height: height * 0.06,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  ImagesManager.reviewAvatar,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                review.authorDetails?.rating.toString() ?? "",
                style: TextStyle(
                  color: AppColors.lightBlue,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                 authorName,
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  review.content ?? "",
                  softWrap: true,
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
