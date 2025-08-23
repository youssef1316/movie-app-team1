import 'package:movie_cellula/features/detail/domian/entites/cast.dart';

abstract class CastState {}

class CastLoadingState extends CastState {}

class CastErrorState extends CastState {
  final String? errorMsg;
  CastErrorState(this.errorMsg);
}

class CastSuccessState extends CastState {
  final List<Cast> cast;
  CastSuccessState(this.cast);
}
