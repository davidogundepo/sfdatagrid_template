
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../api/trainings_games_reels_api.dart';
import '../notifier/trainings_games_reels_notifier.dart';
import 'players_stats_info_page.dart';
import 'players_table_page.dart';
import 'season_timeline_page.dart';
import 'trainings_games_reels_page.dart';

import 'package:provider/provider.dart';

TrainingsAndGamesReelsNotifier trainingsAndGamesReelsNotifier;

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key key}) : super(key: key);

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
    const TrainingsAndGamesReelsPage(),

  ];

  @override
  Widget build(BuildContext context) {

    // trainingsAndGamesReelsNotifier = Provider.of<TrainingsAndGamesReelsNotifier>(context);

    return Scaffold(
      body: _pageOption[selectedPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                    rippleColor: Colors.grey[300],
                    hoverColor: Colors.grey[100],
                    gap: 12,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                    duration: const Duration(microseconds: 400),
                    tabBackgroundColor: Colors.grey[100],
                    color: Colors.black,
                    haptic: true,
                    tabs: const [
                      GButton(
                        gap: 12,
                        icon: Icons.favorite_border,
                        textColor: Colors.blue,
                        iconColor: Colors.teal,
                        iconActiveColor: Colors.deepOrangeAccent,
                        rippleColor: Colors.blueGrey,
                        text: 'Table'
                      ),
                      GButton(
                          gap: 12,
                        icon: Icons.monitor_heart,
                          textColor: Colors.blue,
                          iconColor: Colors.teal,
                          iconActiveColor: Colors.deepOrangeAccent,
                        text: 'Stats'
                      ),
                      GButton(
                          gap: 12,
                        icon: Icons.volunteer_activism,
                          textColor: Colors.blue,
                          iconColor: Colors.teal,
                          iconActiveColor: Colors.deepOrangeAccent,
                        text: 'Timeline'
                      ),
                      GButton(
                          gap: 12,
                        icon: Icons.support_agent,
                        text: 'Reels'
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

    // trainingsAndGamesReelsNotifier = Provider.of<TrainingsAndGamesReelsNotifier>(context, listen: true);
    // getTrainingsAndGamesReels(trainingsAndGamesReelsNotifier);

    super.initState();
  }


}
