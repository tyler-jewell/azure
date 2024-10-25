// ignore_for_file: avoid_print

import 'package:azure/api_client.dart';
import 'package:azure/azure.dart';
import 'package:azure/open_ai/models/open_ai_request.dart';

void main() async {
  final apiClient = ApiClient(
    apiKey: 'INSERT API KEY HERE',
    endpoint: Uri(
      scheme: 'https',
      host: 'INSERT ENDPOINT HERE',
    ),
  );

  final completions = Completions(apiClient);

  final request = OpenAIRequest(
    prompt: 'Write a tagline for an ice cream shop.',
  );

  try {
    final response = await completions.create(
      request,
      'gpt-4o-mini',
    );
    print('Generated tagline: ${response.choices[0].text}');
  } catch (e) {
    print('Error: $e');
  }
}
