import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/home/presentation/view/home_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 3
      ),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HomeLayout()
          )
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Image.asset(
          ImagesManager.logoRoute
        ),
      ),
    );
  }
}
