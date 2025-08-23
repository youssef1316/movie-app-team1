

import 'package:movie_cellula/features/detail/data/models/Cast_model.dart';

class CastResponse {
  final List<CastModel>? cast;

  CastResponse({this.cast});

  factory CastResponse.fromJson(Map<String, dynamic> json) {
    return CastResponse(
      cast: (json['cast'] as List<dynamic>?)
          ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
