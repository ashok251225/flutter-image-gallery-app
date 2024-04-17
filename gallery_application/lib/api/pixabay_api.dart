import 'dart:convert';
import 'package:gallery_application/models/image_response_model.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final String apiKey = '43429965-d29bab66a0dc6a15256a2d509';
  final String baseUrl = 'https://pixabay.com/api/';

  Future<List<Hit>> fetchImages() async {
    final response = await http
        .get(Uri.parse('$baseUrl?key=$apiKey&q=flowers&image_type=photo'));
    if (response.statusCode == 200) {
      ImageResponseModel imageResponse =
          ImageResponseModel.fromJson(jsonDecode(response.body));
      return imageResponse.hits;
    } else {
      throw Exception('Failed to load images');
    }
  }
}
