import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:cricstat/utils/API_URL.dart';
import 'dart:convert';

Future<List<CurrentMatches>> fetchData() async {
  final response = await http.get(Uri.parse('$currentMatches'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
    List<CurrentMatches> matches = [];
    for (int index = jsonResponse.length - 1; index >= 0; index--) {
      final name = jsonResponse[index]['name'];
      final matchType = jsonResponse[index]['matchType'];
      final status = jsonResponse[index]['status'];

      matches.add(
          CurrentMatches(name: name, matchType: matchType, status: status));
    }
    return matches;
  }
  throw Exception('Failed to load album');
}

class CurrentMatches {
  final String name;
  final String matchType;
  final String status;
  CurrentMatches(
      {required this.name, required this.matchType, required this.status});
}
