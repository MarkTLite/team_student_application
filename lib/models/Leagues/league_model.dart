import 'dart:math';

class LeagueModel {
  late String id;
  final String country;
  final String category;
  final String title;
  final String sponsor;
  final String duration;
  final List mgt;
  final String logo;
  final List<Map<String, dynamic>> teams;
  //late final List teamStandings;

  LeagueModel({
    required this.teams,
    required this.country,
    required this.category,
    required this.title,
    required this.sponsor,
    required this.duration,
    required this.mgt,
    required this.logo,
  }) {
    id = Random().nextInt(10000).toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "teams": teams,
      "country": country,
      "category": category,
      "title": title,
      "sponsor": sponsor,
      "duration": duration,
      "mgt": mgt,
      "logo": logo,
    };
  }
}
