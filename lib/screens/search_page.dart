import 'package:cricstat/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:cricstat/utils/text_styles.dart';
import 'package:cricstat/screens/player_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleColor.backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.2,
            image: AssetImage(
              'images/cricket_ball.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      height: 60,
                      image: AssetImage('images/cricket_ball.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'CricStat',
                      style: Styles.ktitleStyle,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    onChanged: (value) {
                      name = value;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: Styles.kTextFieldInputStyle),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerPage(),
                      ));
                },
                child: Text(
                  'Search',
                  style: Styles.kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
