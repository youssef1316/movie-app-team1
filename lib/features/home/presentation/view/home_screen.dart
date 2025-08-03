import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';
import 'package:movie_cellula/core/widgets/top_five_card.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/now_playing_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/popular_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/top_rated_tab.dart';
import 'package:movie_cellula/features/home/presentation/view/tabs/upcoming_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
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
            SizedBox(
              height: AppDimensions.topFiveCardHeight(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsetsDirectional.only(end: 25),
                  child: TopFiveCard(
                    imageUrl: "",
                    numberTag: (index + 1).toString(),
                    onTap: () {
                      // TODO
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
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
                    child: TabBarView(
                      children: [
                        NowPlayingTab(movies: []),
                        UpcomingTab(movies: []),
                        TopRatedTab(movies: []),
                        PopularTab(movies: []),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
