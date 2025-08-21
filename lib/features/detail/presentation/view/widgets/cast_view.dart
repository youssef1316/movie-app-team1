import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/features/detail/presentation/cast_bloc/cast_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/cast_bloc/cast_event.dart';
import 'package:movie_cellula/features/detail/presentation/cast_bloc/cast_state.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/cast_widget.dart';

class MovieCastView extends StatelessWidget {
  final int? movieId;
  const MovieCastView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MovieCastBloc(getIt())..add(GetMovieCastEvent(movieId)),
      child: BlocBuilder<MovieCastBloc, CastState>(
        builder: (context, state) {
          if (state is CastLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if(state is CastErrorState){
             return Center(child: Text(state.errorMsg??''));
          }
          if(state is CastSuccessState){
            final castList =state.cast;
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
               return CastWidget(imagePath: castList[index].profilePath, actorName: castList[index].name);
              },
              itemCount: castList.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),);
          }
          return SizedBox();
        },
      ),
    );
  }
}
