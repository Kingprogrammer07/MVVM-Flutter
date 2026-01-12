import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_JSON_PLACEHOLDER'] ?? 'API_KEY not found';

class AlbumService {
  Future<Map<String, dynamic>> fetchAlbumRaw() async {
    final response = await http.get(Uri.parse(apiKey));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load album from network');
    }
  }
}
