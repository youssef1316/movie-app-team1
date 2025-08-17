import '../../domain/entities/movie.dart';


class WatchListMovieModel {
  final String title;
  final double rating;
  final String year;
  final String duration;
  final String poster;

  const WatchListMovieModel({
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
    required this.poster
  });

  factory WatchListMovieModel.fromEntity (Movie movie) => WatchListMovieModel(
      title: movie.title,
      rating: movie.rating,
      year: movie.year,
      duration: movie.duration,
      poster: movie.poster
  );

  Movie toEntity() => Movie(
      title: title,
      rating: rating,
      year: year,
      duration: duration,
      poster: poster
  );

  factory WatchListMovieModel.fromJson(Map<String, dynamic> json) => WatchListMovieModel(
      title: json['movieTitle'] as String,
      rating: json['rating'] as double,
      year: json['year'] as String,
      duration: json['duration'] as String,
      poster: json['poster'] as String
  );

  Map<String,dynamic> toJson()=> {
    'movieTitle': title,
    'rating' : rating,
    'year' : year,
    'duration' : duration,
    'poster' : poster
  };
}