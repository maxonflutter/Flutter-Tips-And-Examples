import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

// IMPORTANT: Storing an API key on the client is not secure. The example
// is only intended for demonstration purposes. Consider interacting with
// the OpenAI API using a backend server to keep your API key safe!

class SpeechToTextApiClient {
  static const String baseUrl = 'https://api.openai.com';

  /// POST /v1/audio/transcriptions
  /// Used to upload an MP3 file to be converted to text.
  /// Requires a filePath to the local MP3 file.
  Future<Map<String, dynamic>> convertSpeechToText({
    required String filePath,
    String model = 'whisper-1',
  }) async {
    final uri = Uri.parse('$baseUrl/v1/audio/transcriptions');

    // Create a multipart request.
    var request = http.MultipartRequest('POST', uri);

    // Set the authorization header.
    request.headers[HttpHeaders.authorizationHeader] = 'Bearer API_KEY';
    // Add the file to the multipart request.
    var multipartFile = await http.MultipartFile.fromPath(
      'file',
      filePath,
      contentType: MediaType('audio', 'mpeg'),
    );

    // Add the model field.
    request.fields['model'] = model;

    request.files.add(multipartFile);

    // Send the request to the server.
    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      print('Audio uploaded successfully for transcription.');
    } else {
      print('Audio upload failed.');
    }

    final body = jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('${response.statusCode}, error: ${body['message']}');
    }

    return body;
  }
}
