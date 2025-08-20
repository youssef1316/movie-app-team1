import 'package:flutter/material.dart';
import 'package:movie_cellula/core/navigation/routes_manager/routes.dart';
<<<<<<< Updated upstream
import 'package:movie_cellula/features/gemini/presentation/view/gemini_screen.dart';
import 'package:movie_cellula/features/home/presentation/view/home_layout.dart';
import '../../../features/splash/presentation/splash_screen.dart';


=======
import 'package:movie_cellula/features/home/presentation/view/home_layout.dart';
import '../../../features/detail/presentation/view/detail_screen.dart';
import '../../../features/gemini/presentation/view/gemini_ui_screen.dart';
import '../../../features/home/domain/entities/movie.dart';
import '../../../features/splash/presentation/splash_screen.dart';
>>>>>>> Stashed changes

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
          return MaterialPageRoute(builder: (_) => HomeLayout());
        }
      case Routes.geminiRoute:
        {
          return MaterialPageRoute(builder: (_) => GeminiScreen());
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
<<<<<<< Updated upstream
      builder: (_) => HomeLayout()
=======
        builder: (_) => HomeLayout()
>>>>>>> Stashed changes
    );
  }
}