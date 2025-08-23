import '../utils/app_constants.dart';

class AppConfig {
  static const geminiApiKey = AppConstants.gemini_api;
  static const geminiModel =
  String.fromEnvironment('GEMINI_MODEL', defaultValue: 'gemini-1.5-flash-latest');
}