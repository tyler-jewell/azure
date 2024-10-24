// ignore_for_file: avoid_print

import 'package:azure/api_client.dart';
import 'package:azure/azure.dart'; 

void main() async {
  final apiClient = ApiClient(
    apiKey: 'INSERT API KEY HERE',
    endpoint: 'INSERT ENDPOINT HERE',
  );

  final completions = Completions(apiClient);

  final request = CompletionsRequest(
    deploymentId: 'gpt-4o-mini',
    prompt: 'Write a tagline for an ice cream shop.',
    maxTokens: 10,
  );

  try {
    final response = await completions.create(request);
    print('Generated tagline: ${response.choices[0].text}');
  } catch (e) {
    print('Error: $e');
  }
}
