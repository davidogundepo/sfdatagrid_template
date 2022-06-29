import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/cum_motm_players_stats_info_notifier.dart';


getCumMOTMPlayersStatsAndInfo(CumMOTMPlayersStatsAndInfoNotifier cumMOTMPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable')
      .orderBy('man_of_the_match_cum', descending: true)
      .where('man_of_the_match_cum', isGreaterThan: 0)
      .limit(10)
      .get();

  List<PlayersStatsAndInfo> _cumMOTMPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _cumMOTMPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList = _cumMOTMPlayersStatsAndInfoList;

}
