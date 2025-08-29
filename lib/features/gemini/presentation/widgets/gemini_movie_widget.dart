import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../search/presentation/widgets/search_movie_widget.dart';
import '../../../watchList/domain/entities/movie.dart';
import '../../../watchList/presentation/bloc/watchlist_bloc.dart';
import 'package:movie_cellula/features/watchList/presentation/bloc/watch_list_event.dart'
    as event;

class GeminiMovieWidget extends StatelessWidget {
  final String title;
  final double rating;
  final String year;
  final String duration;
  final String poster;
  const GeminiMovieWidget({
    super.key,
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.darkGrey,
      child: Row(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/original$poster",
            width: width * 0.22,
            height: height * 0.17,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: width * 0.22,
              height: height * 0.17,
              color: Colors.grey.shade800,
              child: const Icon(Icons.movie, color: Colors.white70),
            ),
          ),
          SizedBox(width: width*0.01,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height*0.001),
              height: height * 0.17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    height: height * 0.05,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: width * 0.04),
                      Text(
                        rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white70,
                        size: width * 0.04,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        extractYear(year),
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.035,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.white70,
                        size: width * 0.04,
                      ),
                      SizedBox(width: width * 0.01),
                      Text(
                        "$duration min",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.035,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Image.asset(
                        IconsManager.saveIcon,
                        color: Colors.white,
                        width: width * 0.04,
                      ),
                      onPressed: () {
                        BlocProvider.of<WatchlistBloc>(context).add(
                          event.AddMovie(
                            WishListMovie(
                              title: title,
                              rating: rating,
                              year: extractYear(year),
                              duration: duration,
                              poster: "https://image.tmdb.org/t/p/original$poster",
                            ),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Added to Watchlist"),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
