import 'package:azure/api_client.dart';
import 'package:azure/azure.dart'; 

void main() async {
  final apiClient = ApiClient(
    apiKey: 'bb7fb7574f3d4161844a047aa2f0be74',
    endpoint: 'https://jeweltp.openai.azure.com',
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
