import 'package:cricstat/screens/match_score_screen.dart';
import 'package:cricstat/services/score.dart';
import 'package:cricstat/utils/text_styles.dart';
import 'package:cricstat/screens/series_page.dart';
import 'package:flutter/material.dart';
import 'package:cricstat/screens/search_page.dart';
import 'package:cricstat/utils/color_constant.dart';
import 'package:cricstat/screens/series_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CurrentMatches>> futureData;
  int _currentIndex = 0;
  final List<Widget> _pages = [
    SearchPage(),
    SeriesList(),
  ];

  void openMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Search'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.app_registration),
                title: Text('Series'),
                onTap: () {
                  // Handle Home menu option
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SeriesList())); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: StyleColor.appBarColor,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: StyleColor.backgroundColor,
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: StyleColor.appBarColor,
                  ),
                  child: Row(
                    textBaseline: TextBaseline.ideographic,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          onPressed: () => openMenu(context),
                          child: Icon(
                            Icons.menu,
                            size: 50.0,
                          ),
                        ),
                      ),
                      Image(
                        height: 60,
                        image: AssetImage('images/cricket_ball.png'),
                      ),
                      Text(
                        'CricStat',
                        style: Styles.ktitleStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () => fetchData(),
                          child: Icon(
                            Icons.refresh,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<CurrentMatches>>(
                    future: futureData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<CurrentMatches>? matches = snapshot.data;
                        return ListView.builder(
                          itemCount: matches?.length,
                          itemBuilder: (context, index) {
                            final match = matches![index];
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: StyleColor.containerColor,
                              ),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MatchScoreScreen(matchIndex: index),
                                    )),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.sports_cricket_sharp,
                                    size: 50.0,
                                  ),
                                  title: Text(matches![index].name,
                                      style: Styles.kNameTextStyle),
                                  subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            matches![index]
                                                .matchType
                                                .toUpperCase(),
                                            style: Styles.kMatchTypeStyle),
                                        Text(matches![index].status,
                                            style: Styles.kStatusStyle)
                                      ]),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        print('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
