import 'package:flutter/material.dart';
import 'package:movie_cellula/core/models/watchListMovie.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';


class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<WatchListMovie> movies = [
      WatchListMovie(
        title: "Spiderman",
        rating: 9.5,
        genre: "Action",
        year: "2019",
        duration: "139 minutes",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/f/f3/Spider-Man2002Poster.jpg",
      ),
      WatchListMovie(
        title: "Spider-Man: No Way Home",
        rating: 8.5,
        genre: "Action",
        year: "2021",
        duration: "139 minutes",
        poster:
            "https://upload.wikimedia.org/wikipedia/en/0/00/Spider-Man_No_Way_Home_poster.jpg",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: const Text(
          "Watch list",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(screenWidth * 0.04),
        itemCount: movies.length,
        separatorBuilder: (_, __) => SizedBox(height: screenHeight * 0.015),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الصورة
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                child: Image.network(
                  movie.poster,
                  width: screenWidth * 0.22,
                  height: screenHeight * 0.14,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.14,
                    color: Colors.grey.shade800,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.03),
              // بيانات الفيلم
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          movie.rating.toString(),
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.movie,
                          color: Colors.white70,
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          movie.genre,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.white70,
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          movie.year,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white70,
                          size: screenWidth * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          movie.duration,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
