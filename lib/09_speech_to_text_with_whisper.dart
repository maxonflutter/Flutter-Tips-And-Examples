import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

const API_KEY = 'API_KEY';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech to Text',
      theme: ThemeData.light(useMaterial3: true),
      home: const SpeechToTextWidget(),
    );
  }
}

class SpeechToTextWidget extends StatefulWidget {
  const SpeechToTextWidget({super.key});

  @override
  State<SpeechToTextWidget> createState() => _SpeechToTextWidgetState();
}

class _SpeechToTextWidgetState extends State<SpeechToTextWidget> {
  final client = SpeechToTextApiClient();
  var _transcript = '';
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : _transcript != ''
                  ? Text(_transcript)
                  : ElevatedButton(
                      onPressed: () async {
                        const path = 'assets/audios/example_audio.mp3';
                        final audio = await rootBundle.load(path);
                        setState(() => _isLoading = true);

                        final results = await client.convertSpeechToText(
                          audio: audio,
                          filename: 'audio_to_convert.mp3',
                        );

                        setState(() {
                          _transcript = results['text'];
                          _isLoading = false;
                        });
                      },
                      child: const Text('Convert Speech to Text'),
                    ),
        ),
      ),
    );
  }
}

// IMPORTANT: Storing an API key on the client is not secure. The example
// is only intended for demonstration purposes. Consider interacting with
// the OpenAI API using a backend server to keep your API key safe!

class SpeechToTextApiClient {
  static const String baseUrl = 'https://api.openai.com';

  /// POST /v1/audio/transcriptions
  /// Used to upload an MP3 file to be converted to text.
  /// Requires a filePath to the local MP3 file.
  Future<Map<String, dynamic>> convertSpeechToText({
    required String filename,
    required ByteData audio,
    String model = 'whisper-1',
  }) async {
    final uri = Uri.parse('$baseUrl/v1/audio/transcriptions');

    // Create a multipart request.
    var request = http.MultipartRequest('POST', uri);

    // Set the authorization header.
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $API_KEY';

    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      audio.buffer.asUint8List(),
      filename: filename,
      contentType: MediaType('audio', 'mpeg'),
    );

    // Add the model field.
    request.fields['model'] = model;
    request.files.add(multipartFile);

    // Send the request to the server.
    http.Response response = await http.Response.fromStream(
      await request.send(),
    );

    final body = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('${response.statusCode}, error: ${body['message']}');
    }

    return body;
  }
}
