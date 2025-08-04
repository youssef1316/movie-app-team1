import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/widgets/movie_tab_section.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.coverImage,
    required this.smallImage,
    required this.rate,
  });
  final String coverImage;
  final String smallImage;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,

      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Image.asset(IconsManager.saveIcon, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 10),

          Stack(
            clipBehavior: Clip.none,
            children: [
              // Cove Image
              Image.asset(
                ImagesManager.coverDetailsImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              // Small Image
              Positioned(
                left: 29,
                top: 170,
                child: Image.asset(
                  ImagesManager.smallDetailsImage,
                  height: 120,
                  width: 95,
                  fit: BoxFit.fill,
                ),
              ),
              // Rate
              Positioned(
                right: 10,
                top: 190,
                child: Image.asset("assets/images/Rate.png"),
              ),
              // Movie Name
              Positioned(
                right: 90,
                top: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spiderman No Way",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(IconsManager.calenderIcon),
                Text(
                  "2021",
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(IconsManager.vector),
                Image.asset(IconsManager.clockIcon),
                Text(
                  "148 Minutes",
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(IconsManager.vector),

                Image.asset(IconsManager.ticketIcon),
                Text(
                  "Action",
                  style: TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          MovieTabSection(),
        ],
      ),
    );
  }
}
