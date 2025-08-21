import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/detail/presentation/review_bloc/review_bloc.dart';
import 'package:movie_cellula/features/detail/presentation/review_bloc/review_event.dart';
import 'package:movie_cellula/features/detail/presentation/review_bloc/review_state.dart';
import 'package:movie_cellula/features/detail/presentation/view/widgets/review_widget.dart';

class MovieReviewsView extends StatelessWidget {
  final int? movieId;
  const MovieReviewsView({super.key, this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMovieReviewsBloc(getIt())..add(GetMovieReviewsEvent(movieId)),
      child: BlocBuilder<GetMovieReviewsBloc,ReviewState>(builder: (context, state) {
        if(state is ReviewSuccessState ){
          final movieReviews = state.reviews;
          if(movieReviews.isEmpty){
            return Center(child: Text("no reviews for this movie",style:  TextStyle(color: AppColors.white),),);
          }
          return ListView.builder(itemBuilder: (context, index) {
            return ReviewWidget(review: movieReviews[index]);
          },
          itemCount: movieReviews.length,);
        }
        if(state is ReviewLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        if(state is ReviewErrorState){
          return Center(child: Text(state.errorMsg??''),);
        }
        return SizedBox();
      },),
    );
  }
}
