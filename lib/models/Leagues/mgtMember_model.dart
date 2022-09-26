import 'dart:math';

class MgtMemberModel {
  late final String id;
  final String name;
  final String phone;
  final String position;
  Map<String, dynamic> memberMap = {};

  MgtMemberModel(
      {required this.name, required this.phone, required this.position}) {
    id = Random().nextInt(10000).toString();
  }

  Map<String, dynamic> toJson() {
    memberMap = {
      "id": id,
      "name": name,
      "phone": phone,
      "position": position,
    };
    return memberMap;
  }
}
