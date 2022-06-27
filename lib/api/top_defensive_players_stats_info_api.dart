import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/top_defensive_players_stats_info_notifier.dart';


getTopDefensivePlayersStatsAndInfo(TopDefensivePlayersStatsAndInfoNotifier topDefensivePlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable')
      .orderBy('goals_conceded_gk_def')
      .limit(10)
      .get();

  List<PlayersStatsAndInfo> _topDefensivePlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _topDefensivePlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList = _topDefensivePlayersStatsAndInfoList;

}
