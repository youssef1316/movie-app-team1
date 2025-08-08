import 'package:flutter/material.dart';
import 'package:movie_cellula/core/widgets/main_movie_card.dart';
import 'package:movie_cellula/features/detail/presentation/view/detail_screen.dart';
import 'package:movie_cellula/domain/entities/movie.dart';

class TopRatedTab extends StatelessWidget {
  final List <Movie> movies;

  const TopRatedTab({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.65,
      ),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MainMovieCard(
          imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  coverImage: "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                  smallImage: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  rate: movie.voteAverage.toString(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}