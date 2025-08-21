class AppConfig {
  // Get API key from environment variables (secure) or fallback to hardcoded
  static String get geminiApiKey {
    const apiKey = String.fromEnvironment("AIzaSyDF7YmTa0qrK0ALmzMIj2vkDTZEfTV8-Qc");
    if (apiKey.isNotEmpty) {
      return apiKey;
    }
    // ⚠️ Replace with your actual API key for development
    return "AIzaSyDF7YmTa0qrK0ALmzMIj2vkDTZEfTV8-Qc";
  }

  // Gemini model configuration
  static const String geminiModel = 'models/gemini-pro';

  // Response configuration
  static const int maxOutputTokens = 2048;  // Max response length
  static const double temperature = 0.7;    // Creativity level

  // UI Configuration
  static const Duration typingDelay = Duration(milliseconds: 50);
  static const int maxMessagesInMemory = 100;
}