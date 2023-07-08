import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:cricstat/utils/API_URL.dart';
import 'dart:convert';

Future<List<Series>> fetchData() async {
  final response = await http.get(Uri.parse('$series'));
  if (response.statusCode == 200) {
    print(response.body);
    final List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
    List<Series> series = [];
    for (int index = jsonResponse.length - 1; index >= 0; index--) {
      final name = jsonResponse[index]['name'];
      final odi = jsonResponse[index]['odi'];
      final t20 = jsonResponse[index]['t20'];
      final test = jsonResponse[index]['test'];
      series.add(
        Series(
            name: name,
            odi: odi.toString(),
            t20: t20.toString(),
            test: test.toString()),
      );
    }
    return series;
  }
  throw Exception('Failed to load album');
}

class Series {
  final String name;
  final String t20;
  final String odi;
  final String test;

  Series(
      {required this.name,
      required this.t20,
      required this.odi,
      required this.test});
}
