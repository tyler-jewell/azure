// api_client.dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

/// Represents an API client for making requests to the OpenAI API.
class ApiClient {
  /// Creates a new `ApiClient` instance.
  ApiClient({
    required this.apiKey,
    required this.endpoint,
    this.apiVersion = '2024-08-01-preview',
  });

  /// API key.
  final String apiKey;

  /// API version.
  ///
  /// https://learn.microsoft.com/en-us/azure/ai-services/openai/reference#rest-api-versioning
  final String apiVersion;

  /// Endpoint
  final Uri endpoint;

  /// Posts a request to the OpenAI API.
  Future<http.Response> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    /// Add the path to the endpoint.
    final url = endpoint.replace(
      path: path,
      queryParameters: {
        'api-version': apiVersion,
      },
    );

    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };

    final body = jsonEncode(data);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      print(data);
      print(url);
      print(headers);
      throw ApiException(response.statusCode, response.body);
    }
  }
}

/// Represents an exception thrown when an API request fails.
class ApiException implements Exception {
  /// Creates a new `ApiException` instance.
  ApiException(this.statusCode, this.message);

  /// Status code of the API response.
  final int statusCode;

  /// Message of the API response.
  final String message;

  @override
  String toString() => 'ApiException: statusCode=$statusCode, message=$message';
}
