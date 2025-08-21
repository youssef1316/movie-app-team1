import 'package:flutter/material.dart';
import 'package:movie_cellula/features/detail/domian/entites/movie_details.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/cast_view.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/reviews_view.dart';

class MovieTabSection extends StatelessWidget {
  final MovieDetails movieDetails;

  const MovieTabSection({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            indicatorColor: Colors.grey,
            indicatorWeight: 2.5,
            tabs: [
              Tab(text: "About Movie"),
              Tab(text: "Reviews"),
              Tab(text: "Cast"),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    movieDetails.overview ?? 'No overview available',
                    style: const TextStyle(
                      color: Colors.white,
                      height: 1.5,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                MovieReviewsView(movieId: movieDetails.id),
                MovieCastView(movieId: movieDetails.id,)
                ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
