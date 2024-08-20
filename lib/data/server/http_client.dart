import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopsocks/data/cfg.dart';

class AppHttpClient {
  static const String _baseUrl = AppConfing.serverAddress;
  static const String _baseUriTg = AppConfing.serverTgAddress;

// Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    print('POST');
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> apiTg(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUriTg/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    print("RESP ${response.body.isNotEmpty}");
    if (response.statusCode == 200) {
      return {'result': true, 'body': json.decode(response.body)};
    } else {
      return {'result': false};
    }
  }
}
