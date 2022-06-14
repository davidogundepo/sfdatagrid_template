import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/players_stats_info_notifier.dart';


getPlayersStatsAndInfo(PlayersStatsAndInfoNotifier playersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersStatsAndInfo').get();

  List<PlayersStatsAndInfo> _playersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _playersStatsAndInfoList.add(playersStatsAndInfo);
  }

  playersStatsAndInfoNotifier.playersStatsAndInfoList = _playersStatsAndInfoList;

}
