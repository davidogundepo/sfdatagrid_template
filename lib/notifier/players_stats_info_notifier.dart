
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/PlayersStatsAndInfo.dart';


class PlayersStatsAndInfoNotifier with ChangeNotifier {
  List<PlayersStatsAndInfo> _playersStatsAndInfoList = <PlayersStatsAndInfo>[];
  PlayersStatsAndInfo _currentPlayersStatsAndInfo;

  UnmodifiableListView<PlayersStatsAndInfo> get playersStatsAndInfoList => UnmodifiableListView(_playersStatsAndInfoList);

  PlayersStatsAndInfo get currentPlayersStatsAndInfo => _currentPlayersStatsAndInfo;

  set playersStatsAndInfoList(List<PlayersStatsAndInfo> playersStatsAndInfoList) {
    _playersStatsAndInfoList = playersStatsAndInfoList;
    notifyListeners();
  }

  set currentPlayersStatsAndInfo(PlayersStatsAndInfo playersStatsAndInfo) {
    _currentPlayersStatsAndInfo = playersStatsAndInfo;
    notifyListeners();
  }

}