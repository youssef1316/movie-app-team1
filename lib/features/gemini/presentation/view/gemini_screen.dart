
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_cellula/core/DI/di.dart';
import 'package:movie_cellula/core/utils/app_strings.dart';
import 'package:movie_cellula/core/utils/colors_manager.dart';
import 'package:movie_cellula/features/gemini/domain/entities/recommendations.dart';
import 'package:movie_cellula/features/gemini/presentation/bloc/rec_bloc.dart';
import 'package:movie_cellula/features/gemini/presentation/bloc/rec_event.dart';
import 'package:movie_cellula/features/gemini/presentation/bloc/rec_state.dart';
import 'package:movie_cellula/features/gemini/presentation/widgets/gemini_movie_widget.dart';


class GeminiScreen extends StatefulWidget {
  const GeminiScreen({super.key});

  @override
  State<GeminiScreen> createState() => _GeminiScreenState();
}

class _GeminiScreenState extends State<GeminiScreen> {
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "user");
  final recBloc = MovieRecommendationsBloc(getIt());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.getRecommendation,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: _buildUI(),
        ),
      ),
    );
  }

  Widget _buildUI() {

    return BlocConsumer<MovieRecommendationsBloc, RecommendationState>(
      bloc: recBloc,
      listener: (context, state) {
        if (state is RecommendationErrorState) {
          final bot = ChatUser(id: "1", firstName: "Gemini");

          final errorMessage = ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: state.errorMsg!,
          );
          setState(() {
            messages = [errorMessage, ...messages];
          });
        }
        if (state is RecommendationSuccessState) {
          final bot = ChatUser(id: "1", firstName: "Gemini");

          final responseMessage = ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: "Here are some recommendations:",
            customProperties: {
              "recommendations": state.recs, // pass to UI
            },
          );

          setState(() {
            messages = [responseMessage, ...messages];
          });
        }
      },
      builder: (context, state) {
        return DashChat(
          currentUser: currentUser,
          onSend: _sendMessage,
          messages: messages,
          inputOptions: InputOptions(
            inputDecoration: InputDecoration(
              hint: Text("what do you want to watch"),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: AppColors.white),
              ),
            ),
          ),
          messageOptions: MessageOptions(
            messageTextBuilder: (message, previousMessage, nextMessage) {
              if (message.text.contains("No Movies Found")) {
                return Text(
                  message.text,
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
              if (message.customProperties?["recommendations"] != null) {

                final recs =
                    message.customProperties!["recommendations"]
                        as List<Recommendations>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recs.map((r) {
                    return GeminiMovieWidget(title: r.title,
                        rating: r.voteAverage??0,
                        year: r.releaseDate.toString(), duration: r.runtime.toString(),
                        poster: r.posterPath??"");
                  }).toList(),
                );
              }
              return Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              );
            },
          ),
        );
      },
    );
  }

  void _sendMessage(ChatMessage message) {
    setState(() {
      messages = [message, ...messages];
    });

    recBloc.add(
      GetMoviesRecommendationsEvent(
        RecommendationInput(userInput: message.text),
      ),
    );
  }
}
