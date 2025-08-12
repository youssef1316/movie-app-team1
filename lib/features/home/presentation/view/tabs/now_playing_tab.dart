import 'package:flutter/material.dart';
import 'package:movie_cellula/core/entities/movie.dart';
import 'package:movie_cellula/core/widgets/main_movie_card.dart';
import 'package:movie_cellula/features/detail/presentation/view/detail_screen.dart';

class NowPlayingTab extends StatelessWidget {
  final List <Movie> movies;

  const NowPlayingTab({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // Dummy Size of 10 To be Shown.
      itemCount: 10,
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
                  title: movie.title,
                  releasedate: movie.releaseDate,
                  runtime: movie.runtime,
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