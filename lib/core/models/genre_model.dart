
import 'package:movie_cellula/core/entities/genre.dart';

/// id : 18
/// name : "Drama"

class GenreModel {
  GenreModel({
      this.id, 
      this.name,});

  GenreModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

  Genre toDomain(){
    return Genre(
      id: id,
      name: name
    );
  }

}