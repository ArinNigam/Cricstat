import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:cricstat/utils/API_URL.dart';
import 'dart:convert';

Future<List<MatchScore>> fetchData() async {
  final response = await http.get(Uri.parse('$currentMatches'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
    print(jsonResponse);
    List<MatchScore> matches = [];
    for (int index = jsonResponse.length - 1; index >= 0; index--) {
      try {
        for (int i = 0; i < 2; i++) {
          final r = jsonResponse[index]['score'][i]['r'];
          final w = jsonResponse[index]['score'][i]['w'];
          final o = jsonResponse[index]['score'][i]['o'];
          final inning = jsonResponse[index]['score'][i]['inning'];
          matches.add(MatchScore(
              inning: inning,
              r: r.toString(),
              w: w.toString(),
              o: o.toString()));
        }
      } catch (e) {
        print(e);
      }
    }
    return matches;
  }
  throw Exception('Failed to load album');
}

class MatchScore {
  final String r;
  final String w;
  final String o;
  final String inning;
  MatchScore(
      {required this.r,
      required this.w,
      required this.o,
      required this.inning});
}
