import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/movie_tab_section.dart';

class DetailScreen extends StatelessWidget {
  final String coverImage;
  final String smallImage;
  final String rate;
  final String? title;

  final String? releasedate;
  final int? runtime;


  const DetailScreen({
    super.key,
    required this.coverImage,
    required this.smallImage,
    required this.rate,
    required this.title,
    required this.releasedate,
    required this.runtime
  });


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
                Image.network(
                  coverImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: height * 0.3,
                  errorBuilder: (context, error, stackTrace){
                    return Container(
                      width: double.infinity,
                      height: height * 0.3,
                      color: Colors.grey.shade800,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: Colors.white70, size: 40),
                      ),
                    );
                  },
                ),
                // Small Photo
                Positioned(
                  left: width * 0.07,
                  top: height * 0.22,
                  child: Image.network(
                    smallImage,
                    height: height * 0.15,
                    width: width * 0.25,
                    fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: height * 0.3,
                          color: Colors.grey.shade800,
                          child: const Center(
                            child: Icon(
                                Icons.broken_image, color: Colors.white70,
                                size: 40),
                          ),
                        );
                    }
                  ),
                ),
                // Rate
                Positioned(
                  right: width * 0.03,
                  top: height * 0.25,
                  child: Image.asset(
                    "assets/images/Rate.png",
                    width: width * 0.2,
                  ),
                ),
                //  Movie Name
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
                            fontWeight: FontWeight.w500
                          ),
                        )
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
                    releasedate ?? "Unknown",
                    style: TextStyle(
                      color: AppColors.lightGrey,
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset(IconsManager.vector, width: width * 0.015),
                  Image.asset(IconsManager.clockIcon, width: width * 0.05),
                  Text(
                    runtime != null ? "$runtime minutes" : "Unknown",
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
