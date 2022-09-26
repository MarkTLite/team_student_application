import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/Articles/recentArticle_model.dart';

class FireStoreService {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Future<DocumentSnapshot> checkUserSeenAMR(User user) async {
    return firebaseFirestore.collection('students').doc(user.uid).get();
  }

  static updateFirebaseAdminArticles(
      RecentArticleModel recentArticleModel) async {
    final Map<String, dynamic> articleMap = recentArticleModel.toJson();

    await FirebaseFirestore.instance
        .collection('adminArticles')
        .doc(recentArticleModel.articleId)
        .set(articleMap);
  }

  static getLeagueDropdowns() async {
    final dropdowns = [];
    await firebaseFirestore
        .collection('adminDropdowns')
        .doc('countries')
        .get()
        .then((doc) {
      dropdowns.add(doc.get('countries'));
      dropdowns.add(doc.get('categories'));
      dropdowns.add(doc.get('positions'));
    });

    return dropdowns;
  }

  // static updateFirebaseLeague(LeagueModel leagueModel) async {
  //   final Map<String, dynamic> leagueMap = leagueModel.toJson();
  //   await FirebaseFirestore.instance
  //       .collection('adminLeagues')
  //       .doc(leagueModel.id)
  //       .set(leagueMap);
  // }

  static getLeagueTitles(String selectedValue2) async {
    final docsRef = await firebaseFirestore
        .collection('adminLeagues')
        .where('category', isEqualTo: selectedValue2)
        .get();
    final List titles = docsRef.docs
        .map((doc) => {'title': doc.get('title'), 'id': doc.get('id')})
        .toList();

    return titles;
  }

  static Stream<DocumentSnapshot> getLeagueTeams(String selectedId) {
    return firebaseFirestore
        .collection('adminLeagues')
        .doc(selectedId)
        .snapshots();
  }

  static getLeagueTeamsFuture(String selectedId) async {
    final docsRef = await firebaseFirestore
        .collection('adminLeagues')
        .doc(selectedId)
        .get();
    return docsRef.get('teams');
  }

  // static updateFirebaseAdminScores(MatchScoresModel scoresModel) async {
  //   final Map<String, dynamic> scoresMap = scoresModel.toJson();
  //   await FirebaseFirestore.instance
  //       .collection('adminLiveScores')
  //       .doc("${scoresMap['homeTeam']} vs ${scoresMap['awayTeam']}")
  //       .set(scoresMap);
  // }

  static updateFirebaseAdminStandings(
      Map initMap, Map finalMap, String selectedId) async {
    await FirebaseFirestore.instance
        .collection('adminLeagues')
        .doc(selectedId)
        .update({
      "teams": FieldValue.arrayRemove([initMap])
    });

    await FirebaseFirestore.instance
        .collection('adminLeagues')
        .doc(selectedId)
        .update({
      "teams": FieldValue.arrayUnion([finalMap])
    });
  }
}
