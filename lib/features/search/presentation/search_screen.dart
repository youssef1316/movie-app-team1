import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/search/presentation/bloc/search_bloc.dart';
import 'package:movie_cellula/features/search/presentation/bloc/search_state.dart';
import 'package:movie_cellula/features/search/presentation/widgets/no_movies_widget.dart';
import 'package:movie_cellula/features/search/presentation/widgets/search_movie_widget.dart';
import 'bloc/search_event.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchBloc searchBloc = SearchBloc(getIt());

  String query = '';
@override
  void initState() {
    searchBloc.add(GetSearchedMovies(query));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => searchBloc,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Color(0xffECECEC),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextField(
                style: TextStyle(color: AppColors.white),
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                  if (query.trim().isEmpty) {
                    searchBloc.add(ResetSearch());
                  } else {
                    searchBloc.add(GetSearchedMovies(query));
                  }
                },

                decoration: InputDecoration(
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Color(0xff67686D), fontSize: 18),
                  suffixIcon: ImageIcon(
                    AssetImage(IconsManager.searchbarIcon),
                    color: Color(0xff67686D),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  fillColor: AppColors.darkGrey,

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: AppColors.darkGrey),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),

              BlocBuilder<SearchBloc, SearchState>(

                builder: (context, state) {
                  if (state is SearchInitialState) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "Search For a Movie",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );}

                  if (state is SearchErrorState) {
                    return Text(state.message ?? "");
                  }
                  if (state is EmptyListState) {
                    return Expanded(
                      child: Center(
                      child:  NoMoviesWidget()
                      ),
                    );
                  }
                  if (state is SearchLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final movie = state.searchedMovies[index];
                          return SearchMovieWidget(movieId: movie.id!,);
                        },
                        itemCount: state.searchedMovies.length,
                      ),
                    );
                  }
                  if (state is SearchLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(

                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
