import 'dart:math';

class TeamModel {
  late String id;
  final String name;
  final String logo;
  late Map<String, dynamic> teamMap;

  TeamModel({
    required this.name,
    required this.logo,
  }) {
    id = Random().nextInt(50000).toString();
  }

  Map<String, dynamic> toJson() {
    teamMap = {
      'id': id,
      'name': name,
      'logo': logo,
      "Gd": 0,
      "L": 0,
      "P": 0,
      "Pts": 0,
      "W": 0,
    };
    return teamMap;
  }
}
