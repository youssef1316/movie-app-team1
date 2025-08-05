import 'package:flutter/material.dart';
import 'package:movie_cellula/core/widgets/main_movie_card.dart';

class UpcomingTab extends StatelessWidget {
  final List movies;

  const UpcomingTab({
    super.key,
    required this.movies
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.65
      ),
      itemBuilder: (context, index) => MainMovieCard(
          imageUrl: "",
          onTap: (){
            // TODO
          }),
    );
  }
}
