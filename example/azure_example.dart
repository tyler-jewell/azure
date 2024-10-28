// ignore_for_file: avoid_print

import 'package:azure/azure.dart';

void main() async {
  final completions = Completions(
    endpoint: 'INSERT COMPLETIONS ENDPOINT HERE',
    deploymentId: 'davinci-002',
    apiKey: 'INSERT COMPLETIONS API KEY HERE',
    apiVersion: '2024-02-01',
  );

  final request = OpenAIRequest(
    prompt: 'Write a tagline for an ice cream shop.',
  );

  final apiClient = ApiClient(
    request: request,
    completions: completions,
  );

  try {
    final response = await apiClient.post();
    print('Generated tagline: ${response.body}');
  } catch (e) {
    print('Error: $e');
  }
}
