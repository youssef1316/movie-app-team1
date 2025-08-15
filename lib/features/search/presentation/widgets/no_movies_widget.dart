import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';

class NoMoviesWidget extends StatelessWidget {
  const NoMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(IconsManager.noResultIcon),
        SizedBox(height: height * 0.02),
        Text(
          "We Are Sorry, We Can \n Not Find The Movie :(",
          style: TextStyle(
            color: Color(0xffEBEBEF),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
