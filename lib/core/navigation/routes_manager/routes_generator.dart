import 'package:flutter/material.dart';
import 'package:movie_cellula/core/navigation/routes_manager/routes.dart';
import 'package:movie_cellula/features/home/presentation/view/home_layout.dart';
import '../../../features/gemini/presentation/view/gemini_screen.dart';
import '../../../features/splash/presentation/splash_screen.dart';
import '../../../features/detail/presentation/view/detail_screen.dart';



class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.splashRoute:{
        return MaterialPageRoute(builder: (_) => SplashScreen());
      }

      case Routes.movieDetailRoute:
        {
          return MaterialPageRoute(
            builder: (_) => DetailScreen( movieId: settings.arguments as int,
            ),
          );
        }
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

      builder: (_) => HomeLayout()



    );
  }
}