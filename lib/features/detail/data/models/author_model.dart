import 'package:movie_cellula/features/detail/domian/entites/author.dart';

class AuthorModel {
  AuthorModel({this.name, this.username, this.avatarPath, this.rating});

  AuthorModel.fromJson(dynamic json) {
    name = json['name'];
    username = json['username'];
    avatarPath = json['avatar_path'];
    rating = json['rating'];
  }
  String? name;
  String? username;
  dynamic avatarPath;
  double? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    map['rating'] = rating;
    return map;
  }

  Author toDomain() {
    return Author(
      rating: rating,
      name: name,
      avatarPath: avatarPath,
      username: username,
    );
  }
}
