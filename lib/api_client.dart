// api_client.dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

/// Represents an API client for making requests to the OpenAI API.
class ApiClient {
  /// Creates a new `ApiClient` instance.
  ApiClient({required this.apiKey, required this.endpoint});

  /// API key.
  final String apiKey;

  /// Endpoint
  final String endpoint;

  /// Posts a request to the OpenAI API.
  Future<http.Response> post(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final url = Uri.parse('$endpoint$path/?api-version=2024-08-01-preview');
    print(url);
    final headers = {
      'Content-Type': 'application/json',
      'api-key': apiKey,
    };
    final body = jsonEncode(data);

    final response = await http.post(url, headers: headers, body: body);
    _checkResponse(response);
    return response;
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

void _checkResponse(http.Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return;
  } else {
    throw ApiException(response.statusCode, response.body);
  }
}
