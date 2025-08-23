abstract class CastEvent {}

class GetMovieCastEvent extends CastEvent {
  final int? movieId;
  GetMovieCastEvent(this.movieId);
}
