
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sfdatagrid_template/api/cum_motm_players_stats_info_api.dart';
import 'package:sfdatagrid_template/api/motm_players_stats_info_api.dart';
import 'package:sfdatagrid_template/notifier/cum_motm_players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/motm_players_stats_info_notifier.dart';
import '../api/most_assists_players_stats_info_api.dart';
import '../api/most_fouled_rc_players_stats_info_api.dart';
import '../api/most_fouled_yc_players_stats_info_api.dart';
import '../api/player_of_the_month_stats_info_api.dart';
import '../api/top_defensive_players_stats_info_api.dart';
import '../api/top_gk_players_stats_info_api.dart';
import '../api/top_goals_players_stats_info_api.dart';
import '../notifier/most_assists_players_stats_info_notifier.dart';
import '../notifier/most_fouled_rc_players_stats_info_notifier.dart';
import '../notifier/most_fouled_yc_players_stats_info_notifier.dart';
import '../notifier/player_of_the_month_stats_info_notifier.dart';
import '../notifier/top_defensive_players_stats_info_notifier.dart';
import '../notifier/top_gk_players_stats_info_notifier.dart';
import '../notifier/top_goals_players_stats_info_notifier.dart';
import '../api/trainings_games_reels_api.dart';
import '../notifier/trainings_games_reels_notifier.dart';
import 'players_stats_info_page.dart';
import 'players_table_page.dart';
import 'season_timeline_page.dart';
import 'trainings_games_reels_page.dart';

import 'package:provider/provider.dart';

late TrainingsAndGamesReelsNotifier trainingsAndGamesReelsNotifier;
late PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier;
late MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier;
late MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier;
late TopGKPlayersStatsAndInfoNotifier topGKPlayersStatsAndInfoNotifier;
late TopDefensivePlayersStatsAndInfoNotifier topDefensivePlayersStatsAndInfoNotifier;
late TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier;
late MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier;
late MOTMPlayersStatsAndInfoNotifier motmPlayersStatsAndInfoNotifier;
late CumMOTMPlayersStatsAndInfoNotifier cumMOTMPlayersStatsAndInfoNotifier;

Color? backgroundColor = Color.fromRGBO(34, 40, 49, 1);
Color? cardBackgroundColorTwo = Color.fromRGBO(34, 40, 49, 0.611764705882353);
Color? cardBackgroundColor = Color.fromRGBO(57, 62, 70, 1);
Color? goalsScoredTextColor = Color.fromRGBO(255, 141, 41, 1);
Color? appBarIconColor = Color.fromRGBO(255, 141, 41, 1);
Color? appBarBackgroundColor = Color.fromRGBO(34, 40, 49, 1);


class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  bool toggle = false;
  int selectedPage = 0;

  final _pageOption = [
    const PlayersTablePage(),
    const PlayersStatsAndInfoPage(),
    const SeasonTimeline(),
    TrainingsAndGamesReelsPage(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pageOption[selectedPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1)
            )
          ]
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  child: GNav(
                    tabBorderRadius: 10,
                    rippleColor: Colors.blueGrey,
                    hoverColor: Colors.white30,
                    gap: 12,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    duration: const Duration(microseconds: 400),
                    tabBackgroundColor: (cardBackgroundColor)!,
                    color: Colors.black,
                    haptic: true,
                    tabs: [
                      GButton(
                        gap: 12,
                        icon: Icons.favorite_border,
                        textColor: Color.fromRGBO(247, 246, 242, 1),
                        iconColor: Colors.white30,
                        iconActiveColor: Color.fromRGBO(247, 246, 242, 1),
                        rippleColor: Colors.blueGrey,
                        text: 'Table'
                      ),
                      GButton(
                          gap: 12,
                        icon: Icons.monitor_heart,
                          textColor: Color.fromRGBO(247, 246, 242, 1),
                          iconColor: Colors.white30,
                          iconActiveColor: Color.fromRGBO(247, 246, 242, 1),
                        text: 'Stats',
                        rippleColor: Colors.blueGrey,
                      ),
                      GButton(
                        gap: 12,
                        icon: Icons.volunteer_activism,
                        textColor: Color.fromRGBO(247, 246, 242, 1),
                        iconColor: Colors.white30,
                        iconActiveColor: Color.fromRGBO(247, 246, 242, 1),
                        text: 'Timeline',
                        rippleColor: Colors.blueGrey,
                      ),
                      GButton(
                        gap: 12,
                        icon: Icons.support_agent,
                        textColor: Color.fromRGBO(255, 141, 41, 0.7),
                        iconColor: Colors.white30,
                        iconActiveColor: Color.fromRGBO(255, 141, 41, 0.7),
                        text: 'Reels',
                        activeBorder: Border.all(
                            color: Color.fromRGBO(255, 141, 41, 0.7),
                            width: 1
                        ),
                        border: Border.all(
                          color: Colors.transparent
                        ),
                        rippleColor: Colors.white30,
                      ),
                    ],
                    selectedIndex: selectedPage,
                    onTabChange: (index) {
                      setState(() {
                        selectedPage = index;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {

    trainingsAndGamesReelsNotifier = Provider.of<TrainingsAndGamesReelsNotifier>(context, listen: false);
    getTrainingsAndGamesReels(trainingsAndGamesReelsNotifier);

    playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context, listen: false);
    getPlayerOfTheMonthStatsAndInfo(playerOfTheMonthStatsAndInfoNotifier);

    mostFouledYCPlayersStatsAndInfoNotifier = Provider.of<MostFouledYCPlayersStatsAndInfoNotifier>(context, listen: false);
    getMostFouledYCPlayersStatsAndInfo(mostFouledYCPlayersStatsAndInfoNotifier);

    mostFouledRCPlayersStatsAndInfoNotifier = Provider.of<MostFouledRCPlayersStatsAndInfoNotifier>(context, listen: false);
    getMostFouledRCPlayersStatsAndInfo(mostFouledRCPlayersStatsAndInfoNotifier);

    topGKPlayersStatsAndInfoNotifier = Provider.of<TopGKPlayersStatsAndInfoNotifier>(context, listen: false);
    getTopGKPlayersStatsAndInfo(topGKPlayersStatsAndInfoNotifier);

    topDefensivePlayersStatsAndInfoNotifier = Provider.of<TopDefensivePlayersStatsAndInfoNotifier>(context, listen: false);
    getTopDefensivePlayersStatsAndInfo(topDefensivePlayersStatsAndInfoNotifier);

    motmPlayersStatsAndInfoNotifier = Provider.of<MOTMPlayersStatsAndInfoNotifier>(context, listen: false);
    getMOTMPlayersStatsAndInfo(motmPlayersStatsAndInfoNotifier);

    cumMOTMPlayersStatsAndInfoNotifier = Provider.of<CumMOTMPlayersStatsAndInfoNotifier>(context, listen: false);
    getCumMOTMPlayersStatsAndInfo(cumMOTMPlayersStatsAndInfoNotifier);

    topGoalsPlayersStatsAndInfoNotifier = Provider.of<TopGoalsPlayersStatsAndInfoNotifier>(context, listen: false);
    getTopGoalsPlayersStatsAndInfo(topGoalsPlayersStatsAndInfoNotifier);

    mostAssistsPlayersStatsAndInfoNotifier = Provider.of<MostAssistsPlayersStatsAndInfoNotifier>(context, listen: false);
    getMostAssistsPlayersStatsAndInfo(mostAssistsPlayersStatsAndInfoNotifier);


    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }


}
