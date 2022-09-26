import 'dart:math';

class ScorerModel {
  late String id;
  final String name;
  final String team;
  final int minute;
  late Map<String, dynamic> teamMap;

  ScorerModel({
    required this.name,
    required this.team,
    required this.minute,
  }) {
    id = Random().nextInt(50000).toString();
  }

  Map<String, dynamic> toJson() {
    teamMap = {'id': id, 'name': name, 'team': team, 'minute': minute};
    return teamMap;
  }
}
