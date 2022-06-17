
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/PlayersStatsAndInfo.dart';


class MostAssistsPlayersStatsAndInfoNotifier with ChangeNotifier {
  List<PlayersStatsAndInfo> _mostAssistsPlayersStatsAndInfoList = <PlayersStatsAndInfo>[];
  PlayersStatsAndInfo _currentMostAssistsPlayersStatsAndInfo;

  UnmodifiableListView<PlayersStatsAndInfo> get mostAssistsPlayersStatsAndInfoList => UnmodifiableListView(_mostAssistsPlayersStatsAndInfoList);

  PlayersStatsAndInfo get currentMostAssistsPlayersStatsAndInfo => _currentMostAssistsPlayersStatsAndInfo;

  set mostAssistsPlayersStatsAndInfoList(List<PlayersStatsAndInfo> mostAssistsPlayersStatsAndInfoList) {
    _mostAssistsPlayersStatsAndInfoList = mostAssistsPlayersStatsAndInfoList;
    notifyListeners();
  }

  set currentMostAssistsPlayersStatsAndInfo(PlayersStatsAndInfo playersStatsAndInfo) {
    _currentMostAssistsPlayersStatsAndInfo = playersStatsAndInfo;
    notifyListeners();
  }

}