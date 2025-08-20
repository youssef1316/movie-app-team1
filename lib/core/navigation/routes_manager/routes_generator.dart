import 'package:flutter/material.dart';
import 'package:movie_cellula/core/navigation/routes_manager/routes.dart';
import 'package:movie_cellula/features/detail/presentation/view/detail_screen.dart';
import 'package:movie_cellula/features/home/presentation/view/home_layout.dart';
import '../../../features/home/domain/entities/movie.dart';
import '../../../features/splash/presentation/splash_screen.dart';



class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashRoute:{
        return MaterialPageRoute(builder: (_) => SplashScreen());
      }

      // case Routes.movieDetailRoute:
      //   {
      //     return MaterialPageRoute(
      //         builder: (_) => DetailScreen(movie: settings.arguments as Movie));
      //   }
      case Routes.homeLayoutRoute:
        {
          return MaterialPageRoute(
              builder: (_) => HomeLayout());
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
