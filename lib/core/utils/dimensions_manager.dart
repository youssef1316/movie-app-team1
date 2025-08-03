import 'package:flutter/material.dart';

abstract class AppDimensions{
  static double topFiveCardWidth(BuildContext context) => MediaQuery.sizeOf(context).width * 0.35;
  static double topFiveCardHeight(BuildContext context) => MediaQuery.sizeOf(context).height * 0.25;
  static double mainMovieCardWidth(BuildContext context) => MediaQuery.sizeOf(context).width * 0.10;
  static double mainMovieCardHeight(BuildContext context) => MediaQuery.sizeOf(context).height * 0.35;
  static double homeTabHeight(BuildContext context) =>  MediaQuery.sizeOf(context).height * 0.485;
}