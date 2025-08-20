import 'package:flutter/material.dart';
import 'package:movie_cellula/core/navigation/bottom_nav_bar_routes.dart';
import 'package:movie_cellula/core/navigation/routes_manager/routes.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/assets_manager.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      floatingActionButton: MaterialButton(
        onPressed: (){
          Navigator.pushNamed(context, Routes.geminiRoute);
        },
        color: AppColors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Text(
            AppStrings.getRecommendation,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.lightGrey,
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.lightGrey,
        ),
        selectedItemColor: AppColors.lightBlue,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.lightBlue,
        ),
        items: [
          BottomNavigationBarItem(
            label: AppStrings.home,
            icon: Image.asset(IconsManager.homeIcon),
            activeIcon: Image.asset(
              IconsManager.homeIcon,
              color: AppColors.lightBlue,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.search,
            icon: Image.asset(IconsManager.searchIcon),
            activeIcon: Image.asset(
              IconsManager.searchIcon,
              color: AppColors.lightBlue,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.watchList,
            icon: Image.asset(IconsManager.saveIcon),
            activeIcon: Image.asset(
              IconsManager.saveIcon,
              color: AppColors.lightBlue,
            ),
          ),
        ],
        backgroundColor: AppColors.mainColor,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BottomNavBarRoutes.routes[currentIndex],
      ),
    );
  }
}
