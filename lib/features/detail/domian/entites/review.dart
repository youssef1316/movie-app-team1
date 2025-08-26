import 'package:movie_cellula/features/detail/domian/entites/author.dart';

class Review {
  String? author;
  Author? authorDetails;
  String? content;
  String? createdAt;
  String? id;
  String? updatedAt;
  String? url;
  Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });
}
