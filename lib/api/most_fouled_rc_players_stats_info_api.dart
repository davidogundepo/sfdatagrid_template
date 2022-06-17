import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/most_fouled_rc_players_stats_info_notifier.dart';


getMostFouledRCPlayersStatsAndInfo(MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTabled').orderBy('red_card', descending: true).limit(5).get();

  List<PlayersStatsAndInfo> _mostFouledRCPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _mostFouledRCPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  mostFouledRCPlayersStatsAndInfoNotifier.mostFouledRCPlayersStatsAndInfoList = _mostFouledRCPlayersStatsAndInfoList;

}
