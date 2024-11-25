import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnnoncesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _annonces = [];

  List<Map<String, dynamic>> get annonces => _annonces;

  Future<void> fetchAnnonces() async {
    final url = Uri.parse('http://localhost:3000/annonces'); // URL de l'API
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        _annonces = List<Map<String, dynamic>>.from(json.decode(response.body));
        notifyListeners();
      } else {
        throw Exception('Failed to load annonces');
      }
    } catch (error) {
      rethrow;
    }
  }
}
