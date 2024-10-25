// open_ai/endpoints/completions.dart

import 'dart:convert';

import 'package:azure/api_client.dart';
import 'package:azure/open_ai/models/completions_model.dart';
import 'package:azure/open_ai/models/open_ai_request.dart';

/// Represents a request to the OpenAI Completions API.
class Completions {
  /// Creates a new `Completions` instance.
  Completions(this._client);
  final ApiClient _client;

  /// Creates a new `Completions` instance.
  Future<CompletionsResponse> create(
    OpenAIRequest request,
    String deploymentId,
  ) async {
    final response = await _client.post(
      '/openai/deployments/$deploymentId/chat/completions',
      data: request.toJson(),
    );
    return CompletionsResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }
}
