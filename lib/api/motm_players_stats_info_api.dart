import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/motm_players_stats_info_notifier.dart';


getMOTMPlayersStatsAndInfo(MOTMPlayersStatsAndInfoNotifier mOTMPlayersStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable')
      .where('man_of_the_match', whereIn: ['yes','Yes','YES', 'yES', 'yeS', 'YEs', 'yEs'])
      .limit(10)
      .get();

  List<PlayersStatsAndInfo> _mOTMPlayersStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _mOTMPlayersStatsAndInfoList.add(playersStatsAndInfo);
  }

  mOTMPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList = _mOTMPlayersStatsAndInfoList;

}
