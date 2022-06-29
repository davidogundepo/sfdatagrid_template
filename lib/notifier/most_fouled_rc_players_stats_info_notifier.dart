
import 'dart:collection';
import 'package:flutter/cupertino.dart';
import '../model/PlayersStatsAndInfo.dart';


class MostFouledRCPlayersStatsAndInfoNotifier with ChangeNotifier {
  List<PlayersStatsAndInfo> _mostFouledRCPlayersStatsAndInfoList = <PlayersStatsAndInfo>[];
  late PlayersStatsAndInfo _currentMostFouledRCPlayersStatsAndInfo;

  UnmodifiableListView<PlayersStatsAndInfo> get mostFouledRCPlayersStatsAndInfoList => UnmodifiableListView(_mostFouledRCPlayersStatsAndInfoList);

  PlayersStatsAndInfo get currentMostFouledRCPlayersStatsAndInfo => _currentMostFouledRCPlayersStatsAndInfo;

  set mostFouledRCPlayersStatsAndInfoList(List<PlayersStatsAndInfo> mostFouledRCPlayersStatsAndInfoList) {
    _mostFouledRCPlayersStatsAndInfoList = mostFouledRCPlayersStatsAndInfoList;
    notifyListeners();
  }

  set currentMostFouledRCPlayersStatsAndInfo(PlayersStatsAndInfo playersStatsAndInfo) {
    _currentMostFouledRCPlayersStatsAndInfo = playersStatsAndInfo;
    notifyListeners();
  }

}