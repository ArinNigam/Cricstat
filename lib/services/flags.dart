import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cricstat/utils/API_URL.dart';

class CountryFlag {
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('$countries'));
    return (response.statusCode == 200)
        ? print(response.body)
        : print('Error: ${response.statusCode}');
  }
}
