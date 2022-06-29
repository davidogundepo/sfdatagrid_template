import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/PlayersStatsAndInfo.dart';
import '../notifier/player_of_the_month_stats_info_notifier.dart';


getPlayerOfTheMonthStatsAndInfo(PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier) async {

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('PlayersTable')
      .where('player_of_the_month', whereIn: ['yes','Yes','YES', 'yES', 'yeS', 'YEs', 'yEs'])
      .limit(1).get();

  List<PlayersStatsAndInfo> _playerOfTheMonthStatsAndInfoList = [];

  for (var document in snapshot.docs) {
    PlayersStatsAndInfo playersStatsAndInfo = PlayersStatsAndInfo.fromMap(document.data());
    _playerOfTheMonthStatsAndInfoList.add(playersStatsAndInfo);
  }

  playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList = _playerOfTheMonthStatsAndInfoList;

}
