import 'package:cricstat/services/score.dart';
import 'package:cricstat/utils/API_URL.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cricstat/services/score.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late Future<CurrentMatches> futureData;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
