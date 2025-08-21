import 'package:flutter/material.dart';
import 'package:movie_cellula/core/widgets/main_movie_card.dart';
import '../../../../../core/navigation/routes_manager/routes.dart';
import '../../../domain/entities/movie.dart';


class PopularTab extends StatelessWidget {
  final List<Movie> movies;

  const PopularTab({super.key, required this.movies});

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
            Navigator.pushNamed(
              context,
              Routes.movieDetailRoute,
              arguments: movie.id,

            );
          },
        );
      },
    );
  }
}
