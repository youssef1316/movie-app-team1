import 'package:flutter/material.dart';
import 'package:movie_cellula/core/widgets/main_movie_card.dart';
import 'package:movie_cellula/features/detail/presentation/view/detail_screen.dart';

class NowPlayingTab extends StatelessWidget {
  final List movies;

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
      itemBuilder: (context, index) => MainMovieCard(
        imageUrl: "",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailScreen(
                // TODO
                coverImage: "",
                smallImage: "",
                rate: "",
              ),
            ),
          );
        },
      ),
    );
  }
}
