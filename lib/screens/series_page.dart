import 'package:flutter/material.dart';
import 'package:cricstat/screens/home_screen.dart';
import 'package:cricstat/services/series.dart';
import 'package:cricstat/utils/text_styles.dart';
import 'package:cricstat/utils/color_constant.dart';

class SeriesList extends StatefulWidget {
  SeriesList({super.key});

  @override
  State<SeriesList> createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  late Future<List<Series>> futureData;
  void initState() {
    super.initState();
    futureData = fetchData();
  }

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
              Expanded(
                child: FutureBuilder<List<Series>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Series>? matches = snapshot.data;
                      return ListView.builder(
                        itemCount: matches?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: StyleColor.containerColor,
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.sports_cricket_sharp,
                                size: 50.0,
                              ),
                              title: Text(matches![index].name,
                                  style: Styles.kButtonTextStyle),
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(' ' + matches[index].odi + ' :ODIs',
                                        style: Styles.kODI),
                                    Text(' ' + matches[index].t20 + ' :T20s',
                                        style: Styles.kODI),
                                    Text(' ' + matches[index].test + ' :Tests',
                                        style: Styles.kODI)
                                  ]),
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
    );
  }
}
