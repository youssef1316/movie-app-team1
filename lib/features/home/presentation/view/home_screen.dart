import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';
import 'package:movie_cellula/core/widgets/top_five_card.dart';
import 'package:movie_cellula/features/detail/presentation/view/detail_screen.dart';

import 'package:movie_cellula/features/home/presentation/view/tabs/now_playing_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/popular_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/top_rated_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/upcoming_tab.dart';

import 'package:movie_cellula/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_cellula/features/home/presentation/bloc/home_state.dart';
import 'package:movie_cellula/features/home/presentation/bloc/home_event.dart';
import 'package:movie_cellula/core/DI/di.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt <HomeBloc>()..add(FetchHomeData()),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.homeScreenText,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Top 5 Movies (from Bloc)
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return SizedBox(
                      height: AppDimensions.topFiveCardHeight(context),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is HomeLoaded) {
                    return SizedBox(
                      height: AppDimensions.topFiveCardHeight(context),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.trendMovies.take(5).length,
                        itemBuilder: (context, index) {
                          final trends = state.trendMovies[index];
                          return Padding(
                            padding: EdgeInsetsDirectional.only(end: 25),
                            child: TopFiveCard(
                              movie:trends,
                              numberTag: (index + 1).toString(),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      coverImage: trends.posterPath!,
                                      smallImage: trends.backdropPath!,
                                      title: trends.title,
                                      releasedate: trends.releaseDate,
                                      runtime: trends.runtime,
                                      rate: trends.voteAverage.toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is HomeError) {
                    return SizedBox(
                      height: AppDimensions.topFiveCardHeight(context),
                      child: Center(child: Text(state.message)),
                    );
                  }
                  return SizedBox(
                    height: AppDimensions.topFiveCardHeight(context),
                  );
                },
              ),

              SizedBox(height: 10),

              // Tabs with Movies (from Bloc)
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      physics: NeverScrollableScrollPhysics(),
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      indicatorColor: AppColors.lightGrey,
                      labelColor: AppColors.white,
                      tabs: [
                        Tab(text: AppStrings.nowPlayingTab),
                        Tab(text: AppStrings.upcomingTab),
                        Tab(text: AppStrings.topRatedTab),
                        Tab(text: AppStrings.popularTab),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: AppDimensions.homeTabHeight(context),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is HomeLoaded) {
                            return TabBarView(
                              children: [
                                NowPlayingTab(
                                    movies: state.nowPlayingMovies),
                                UpcomingTab(movies: state.upcomingMovies),
                                TopRatedTab(movies: state.topRatedMovies),
                                PopularTab(movies: state.popularMovies),
                              ],
                            );
                          } else if (state is HomeError) {
                            return Center(child: Text(state.message));
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
