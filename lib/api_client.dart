// api_client.dart
// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:azure/completions.dart';
import 'package:azure/open_ai_request.dart';
import 'package:http/http.dart' as http;

/// Represents an API client for making requests to the OpenAI API.
class ApiClient {
  /// Creates a new `ApiClient` instance.
  ApiClient({
    required this.request,
    required this.completions,
  });

  /// The OpenAI completions endpoint.
  final Completions completions;

  /// The OpenAI request.
  final OpenAIRequest request;

  /// Posts a request to the OpenAI API.
  Future<http.Response> post() async {
    final headers = {
      'Content-Type': 'application/json',
      'api-key': completions.apiKey,
    };

    print('request body: ${request.toJson()}');

    final response = await http.post(
      completions.uri,
      headers: headers,
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      print(completions.uri);
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
