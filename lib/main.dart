import 'package:cricstat/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'utils/color_constant.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      color: StyleColor.backgroundColor,
      home: HomeScreen(),
    );
  }
}
