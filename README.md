# Azure Dart Package

The `azure` Dart package is a monorepo consisting of multiple sub-packages, starting with the `open_ai` and `ai` packages. The `open_ai` package provides an easy-to-use interface to interact with Azure OpenAI services, including features such as completions, embeddings, chat completions, image generation, transcriptions, and translations. The `ai` package is a placeholder for future Azure AI services.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
  - [Initialization](#initialization)
  - [Completions](#completions)
  - [Embeddings](#embeddings)
  - [Chat Completions](#chat-completions)
  - [Image Generation](#image-generation)
  - [Audio Transcriptions](#audio-transcriptions)
  - [Audio Translations](#audio-translations)
- [Project Structure](#project-structure)
- [Future-proofing](#future-proofing)

## Features

- **Completions**: Generate text based on provided prompts.
- **Embeddings**: Get vector representations of given inputs for use in machine learning models.
- **Chat Completions**: Create conversational AI responses.
- **Image Generation**: Generate images based on text descriptions using DALL-E.
- **Audio Transcriptions**: Transcribe audio into text.
- **Audio Translations**: Translate audio into English.

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  azure: ^1.0.0
```

Then, run:

```sh
dart pub get
```

## Usage

### Initialization
To start using the package, you need to initialize the `Azure` class by providing your Azure endpoint and API key.

```dart
import 'package:azure/azure.dart';

void main() {
  final azure = Azure(
    endpoint: 'https://YOUR_RESOURCE_NAME.azure.com',
    apiKey: 'YOUR_API_KEY',
  );
}
```

### Completions
Generate completions based on a prompt.

```dart
final completions = await azure.openAI.completions.createCompletion(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  prompt: 'Tell me a joke about cats.',
  maxTokens: 50,
  temperature: 0.8,
);
print(completions);
```

### Embeddings
Create embeddings for given inputs.

```dart
final embeddings = await azure.openAI.embeddings.createEmbedding(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  inputs: ['This is a test sentence.'],
);
print(embeddings);
```

### Chat Completions
Generate chat completions for a conversation.

```dart
final chatResponse = await azure.openAI.chat.createChatCompletion(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  messages: [
    {'role': 'user', 'content': 'What is the weather like today?'}
  ],
);
print(chatResponse);
```

### Image Generation
Generate images based on a prompt using DALL-E.

```dart
final images = await azure.openAI.images.generateImage(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  prompt: 'A futuristic city skyline at sunset.',
);
print(images);
```

### Audio Transcriptions
Transcribe an audio file.

```dart
final transcription = await azure.openAI.transcriptions.transcribe(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  filePath: 'path/to/audio/file.wav',
);
print(transcription);
```

### Audio Translations
Translate audio to English.

```dart
final translation = await azure.openAI.translations.translate(
  deploymentId: 'YOUR_DEPLOYMENT_ID',
  filePath: 'path/to/audio/file.wav',
);
print(translation);
```

## Project Structure
The package is organized into separate files for handling different functionalities:

```plaintext
lib/
│   azure.dart                // Main entry point
│   api_client.dart           // Core HTTP client for making requests
│
├── open_ai/                  // OpenAI sub-package for Azure services
│   ├── endpoints/            // API endpoints for different Azure OpenAI services
│   │       completions.dart       // API for Completions
│   │       embeddings.dart        // API for Embeddings
│   │       chat_completions.dart  // API for Chat Completions
│   │       images.dart            // API for Image Generation
│   │       audio_transcriptions.dart // API for Transcriptions
│   │       audio_translations.dart   // API for Translations
│   └── models/               // Models for request/response data
│           completions_model.dart
│           embeddings_model.dart
│           chat_model.dart
│           images_model.dart
│           audio_model.dart
│
├── ai/                       // Placeholder for future Azure AI services
```

## Future-proofing
The `azure` package is designed to support future changes in Azure REST API versions. The core HTTP client (`api_client.dart`) allows specifying the API version, making it easy to adapt to future updates by modifying the `api-version` parameter.

If Azure releases a new API version, you can update the `apiVersion` parameter accordingly without changing the core logic of your code.

## Contributing
Contributions are welcome! Please submit issues and pull requests to help improve the package.

## License
This package is available under the MIT License.

