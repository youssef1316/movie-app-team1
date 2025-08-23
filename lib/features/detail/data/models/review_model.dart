import 'package:movie_cellula/features/detail/domian/entites/review.dart';

import 'author_model.dart';

/// author : "MovieGuys"
/// author_details : {"name":"","username":"MovieGuys","avatar_path":null,"rating":6}
/// content : "Its amazing what you accomplish with a creative script, even on a limited budget. \r\n\r\n\"War of the Worlds\" isn't going to win any awards but  its nonetheless still quite entertaining. \r\n\r\nThe notion of the whole alien invasion playing out from the control room of a US NSA surveillance agent, is novel, as is the manner in which everything is nicely brought together. The acting  is decent too, so no complaints there, either. \r\n\r\nPerhaps the only limited downside is the special effects, which are only passable. That said, they still function well enough, to make the whole thing enjoyable. \r\n\r\nIn summary, a simple but watchable sci fi experience. A nice distraction for a wet weekend."
/// created_at : "2025-07-31T05:52:34.202Z"
/// id : "688b04a2e6ed8e883ab5b289"
/// updated_at : "2025-07-31T05:56:21.691Z"
/// url : "https://www.themoviedb.org/review/688b04a2e6ed8e883ab5b289"

class ReviewModel {
  ReviewModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  ReviewModel.fromJson(dynamic json) {
    author = json['author'];
    authorDetails = json['author_details'] != null
        ? AuthorModel.fromJson(json['author_details'])
        : null;
    content = json['content'];
    createdAt = json['created_at'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
  }
  String? author;
  AuthorModel? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['author'] = author;
    if (authorDetails != null) {
      map['author_details'] = authorDetails?.toJson();
    }
    map['content'] = content;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    return map;
  }

  Review toDomain() {
    return Review(
      id: id,
      author: author,
      authorDetails: authorDetails?.toDomain(),
      content: content,
      createdAt: createdAt,
      updatedAt: updatedAt,
      url: url,
    );
  }
}
