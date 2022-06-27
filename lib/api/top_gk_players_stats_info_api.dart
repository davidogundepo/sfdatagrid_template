import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/top_gk_players_stats_info_notifier.dart';


getTopGKPlayersStatsAndInfo(TopGKPlayersStatsAndInfoNotifier topGKPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable').orderBy('clean_sheets', descending: true).limit(10).get();

  List<PlayersStatsAndInfo> _topGKPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _topGKPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList = _topGKPlayersStatsAndInfoList;

}
