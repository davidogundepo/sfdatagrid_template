import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/most_fouled_yc_players_stats_info_notifier.dart';


getMostFouledYCPlayersStatsAndInfo(MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable')
      .where('yellow_card', isGreaterThan: 0)
      .orderBy('yellow_card', descending: true)
      .limit(8).get();

  List<PlayersStatsAndInfo> _mostFouledYCPlayersStatsAndInfoList = [];



  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _mostFouledYCPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList = _mostFouledYCPlayersStatsAndInfoList;

}
