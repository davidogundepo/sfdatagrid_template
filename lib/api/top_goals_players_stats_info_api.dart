import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/top_goals_players_stats_info_notifier.dart';


getTopGoalsPlayersStatsAndInfo(TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTabled')
      // .orderBy('goals_scored', descending: true).limit(10)
      .get();

  List<PlayersStatsAndInfo> _topGoalsPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _topGoalsPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList = _topGoalsPlayersStatsAndInfoList;

}
