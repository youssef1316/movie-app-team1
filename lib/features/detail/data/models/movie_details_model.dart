
import 'package:movie_cellula/features/detail/domian/entites/movie_details.dart';

import 'genre_model.dart';

/// adult : false
/// backdrop_path : "/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg"
/// belongs_to_collection : null
/// budget : 25000000
/// genres : [{"id":18,"name":"Drama"},{"id":80,"name":"Crime"}]
/// homepage : ""
/// id : 278
/// imdb_id : "tt0111161"
/// origin_country : ["US"]
/// original_language : "en"
/// original_title : "The Shawshank Redemption"
/// overview : "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."
/// popularity : 38.5399
/// poster_path : "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg"
/// production_companies : [{"id":97,"logo_path":"/7znWcbDd4PcJzJUlJxYqAlPPykp.png","name":"Castle Rock Entertainment","origin_country":"US"}]
/// production_countries : [{"iso_3166_1":"US","name":"United States of America"}]
/// release_date : "1994-09-23"
/// revenue : 28341469
/// runtime : 142
/// spoken_languages : [{"english_name":"English","iso_639_1":"en","name":"English"}]
/// status : "Released"
/// tagline : "Fear can hold you prisoner. Hope can set you free."
/// title : "The Shawshank Redemption"
/// video : false
/// vote_average : 8.712
/// vote_count : 28630

class MovieDetailsModel {
  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,

    this.releaseDate,
    this.revenue,
    this.runtime,

    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieDetailsModel.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenreModel.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'] != null
        ? json['origin_country'].cast<String>()
        : [];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];

    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];

    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<GenreModel>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['belongs_to_collection'] = belongsToCollection;
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['origin_country'] = originCountry;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;

    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;

    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  MovieDetails toDomain() {
    return MovieDetails(
      voteCount: voteCount,
      voteAverage: voteAverage,
      video: video,
      title: title,
      releaseDate: releaseDate,
      posterPath: posterPath,
      popularity: popularity,
      overview: overview,
      originalTitle: originalTitle,
      originalLanguage: originalLanguage,
      id: id,
      backdropPath: backdropPath,
      adult: adult,
      belongsToCollection: belongsToCollection,
      budget: budget,
      genres: genres?.map((genres) => genres.toDomain()).toList(),
      homepage: homepage,
      imdbId: imdbId,
      originCountry: originCountry,
      revenue: revenue,
      runtime: runtime,
      status: status,
      tagline: tagline,
    );
  }
}
