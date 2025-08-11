import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Center(
          child: Text('Search Screen', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
