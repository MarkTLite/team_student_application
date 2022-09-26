import 'dart:math';

import 'package:intl/intl.dart';

class MatchScoresModel {
  late String id;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String leagueTitle;
  final String country;
  final String category;
  final List scoresList;
  final List foulsList;
  late Map<String, dynamic> scoresMap;
  late int timestamp;

  MatchScoresModel({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.leagueTitle,
    required this.country,
    required this.category,
    required this.scoresList,
    required this.foulsList,
  }) {
    id = Random().nextInt(30000).toString();
    timestamp = int.parse(DateTime.now().microsecondsSinceEpoch.toString());
  }

  Map<String, dynamic> toJson() {
    scoresMap = {
      "id": id,
      "homeTeam": homeTeam,
      "awayTeam": awayTeam,
      "homeScore": homeScore,
      "awayScore": awayScore,
      "leagueTitle": leagueTitle,
      "country": country,
      "category": category,
      "scoresList": scoresList,
      "foulsList": foulsList,
      "timestamp": timestamp
    };
    return scoresMap;
  }
}
