import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/most_assists_players_stats_info_notifier.dart';


getMostAssistsPlayersStatsAndInfo(MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTabled').orderBy('assists', descending: true).limit(10).get();

  List<PlayersStatsAndInfo> _mostAssistsPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _mostAssistsPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList = _mostAssistsPlayersStatsAndInfoList;

}
