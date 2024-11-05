// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<void> rsvpEvent(String name, String email) async {
    final url = Uri.parse('$_baseUrl/posts');
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email}),
      );

      if (response.statusCode == 201) {
        print(response.body);
        print('RSVP Successful');
      } else {
        throw Exception('Submission failed. Status code: ${response.statusCode}');
      }
    } on http.ClientException {
      throw Exception('Submission failed. Please check your internet connection and try again.');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
