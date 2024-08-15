import 'dart:convert';
import 'package:http/http.dart' as http;

class PexelsService {
  final String apiKey =
      'sVleIjp4aWPKcXhDCQj7GSJhy1aASvT8dHsr0H7E7RJiWcdX49DjznG1';

  Future<List<String>> fetchNatureVideos() async {
    final response = await http.get(
      Uri.parse('https://api.pexels.com/videos/search?query=nature'),
      headers: {'Authorization': apiKey},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return List<String>.from(
          data['videos'].map((video) => video['video_files'][0]['link']));
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
