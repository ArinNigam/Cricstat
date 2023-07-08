import 'package:flutter/material.dart';

class Styles {
  static const TextStyle kButtonTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Roboto+Condensed',
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kNameTextStyle = TextStyle(
    fontSize: 24.0,
    fontFamily: 'Roboto+Condensed',
    color: Color(0xfff8f7ff),
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Roboto+Condensed',
  );
  static const TextStyle ktitleStyle = TextStyle(
    fontSize: 40.0,
    fontFamily: 'Roboto+Condensed',
    fontWeight: FontWeight.w800,
    color: Color(0xff4cc9f0),
  );
  static const TextStyle kMatchTypeStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Roboto+Condensed',
    color: Color(0xfff94144),
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kStatusStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Roboto+Condensed',
    color: Colors.white54,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle kODI = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Roboto+Condensed',
    color: Color(0xffff006e),
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kT20 = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Roboto+Condensed',
    color: Color(0xff3a86ff),
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kTest = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Roboto+Condensed',
    color: Color(0xffd90429),
    fontWeight: FontWeight.bold,
  );

  static const InputDecoration kTextFieldInputStyle = InputDecoration(
    hintText: 'Enter Player Name',
    hintStyle: TextStyle(color: Colors.grey),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none),
  );
}
