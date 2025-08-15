import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/colors_manager.dart';

class MovieInfoWidget extends StatelessWidget {
  final String text;
  final String asset;
  const MovieInfoWidget({required this.text,required this.asset,super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return   Row(
      children: [
        SvgPicture.asset(
         asset,
          height: height * 0.022,
          width: width * 0.022,
        ),
        SizedBox(width: width * 0.01),
        Text(
         text,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
