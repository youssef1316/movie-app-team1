import 'package:flutter/material.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/core/utils/dimensions_manager.dart';

class GeminiScreen extends StatelessWidget {
  const GeminiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController geminiController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      )
                  ),
                  SizedBox(width: AppDimensions.quarterScreenWidth(context)),
                  Text(
                    AppStrings.getRecommendation,
                    style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      //TODO
                    },
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: geminiController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                )
                            )
                        )
                    ),
                    SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.lightBlue,
                      ),
                      child: IconButton(
                        onPressed: (){
                          //TODO
                        },
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                              Icons.send
                          ),
                        ),
                        color: AppColors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}