import 'package:cricstat/screens/match_score_screen.dart';
import 'package:cricstat/services/score.dart';
import 'package:cricstat/utils/text_styles.dart';
import 'package:cricstat/screens/series_page.dart';
import 'package:flutter/material.dart';
import 'package:cricstat/screens/search_page.dart';
import 'package:cricstat/utils/color_constant.dart';
import 'package:cricstat/screens/series_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          onPressed: () => openMenu(context),
                          child: Icon(
                            Icons.menu,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Image(
                        height: 50,
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
                            size: 30.0,
                            color: Colors.white,
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
                              margin: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                              decoration: BoxDecoration(
                                color: StyleColor.containerColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Card(
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: StyleColor.containerColor,
                                  ),
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MatchScoreScreen(matchIndex: index),
                                        )),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(30),
                                                ),
                                                child: Icon(
                                                  Icons.sports_cricket_outlined,
                                                  color: Colors.yellow.shade700,
                                                  size: 30.0,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 2),
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(15)),
                                                child: Text(
                                                    matches![index]
                                                        .matchType
                                                        .toUpperCase(),
                                                    style: GoogleFonts.poppins(textStyle:Styles.kMatchTypeStyle ) ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 6,),
                                          Text(matches![index].name,
                                              style: GoogleFonts.poppins(
                                                  textStyle:
                                                      Styles.kNameTextStyle)),
                                                SizedBox(height: 4,),

                                                ListTile(

                                                    leading: Icon(Icons.update , color: Colors.blue.shade100,),
                                                   title: Text(matches![index].status,
                                                          style: GoogleFonts.roboto(textStyle:Styles.kStatusStyle ) ),


                                                )

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        print('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return Center(child: const CircularProgressIndicator());
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
