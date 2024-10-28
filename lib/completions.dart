// open_ai/models/completions.dart

/// Represents a request to the OpenAI Completions API.
///
/// https://learn.microsoft.com/en-us/azure/ai-services/openai/reference#completions
class Completions {
  /// Creates a new `Completions` instance.
  Completions({
    required this.endpoint,
    required this.deploymentId,
    required this.apiVersion,
    required this.apiKey,
    this.contentType = 'application/json',
  });

  /// The deployment ID to use for this request.
  final String deploymentId;

  /// The endpoint to use for this request.
  final String endpoint;

  /// The api version to use for this request.
  final String apiVersion;

  /// The api key to use for this request.
  final String apiKey;

  /// The content type to use for this request.
  final String contentType;

  /// To [Uri]
  Uri get uri => Uri(
        scheme: 'https',
        host: endpoint,
        path: '/openai/deployments/$deploymentId/completions',
        queryParameters: {
          'api-version': apiVersion,
        },
      );

  /// Get the header map.
  Map<String, String> get headers => {
        'Content-Type': contentType,
        'api-key': apiKey,
      };
}
