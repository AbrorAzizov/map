class AppApiConfig {
  final String baseUrl;
  final Duration timeout;
  final String? apiKey;

  const AppApiConfig({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 30),
    this.apiKey,
  });
}
