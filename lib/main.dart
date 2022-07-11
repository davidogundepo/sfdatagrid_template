import 'dart:async';

import 'package:flutter/material.dart';
import '../notifier/coaches_reviews_comment_notifier.dart';
import '../notifier/founders_reviews_comment_notifier.dart';
import './notifier/cum_motm_players_stats_info_notifier.dart';
import './notifier/motm_players_stats_info_notifier.dart';
import './notifier/top_defensive_players_stats_info_notifier.dart';
import './notifier/top_gk_players_stats_info_notifier.dart';
import './notifier/player_of_the_month_stats_info_notifier.dart';
import './notifier/most_assists_players_stats_info_notifier.dart';
import './notifier/most_fouled_yc_players_stats_info_notifier.dart';
import './notifier/most_fouled_rc_players_stats_info_notifier.dart';
import './notifier/top_goals_players_stats_info_notifier.dart';
import './notifier/trainings_games_reels_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'bottom_nav_pages/bottom_navigator.dart';
import 'package:provider/provider.dart';

Color? backgroundColor = Colors.indigo[400];
Color? appBarIconColor = Colors.indigo[200];
Color? appBarBackgroundColor = Colors.indigo[400];
Color? secondStudentChartColor = Colors.indigo[400];


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZonedGuarded(() {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MostAssistsPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MostFouledYCPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MostFouledRCPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopGoalsPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopGKPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TopDefensivePlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => MOTMPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CumMOTMPlayersStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => TrainingsAndGamesReelsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlayerOfTheMonthStatsAndInfoNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => CoachesReviewsCommentNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => FoundersReviewsCommentNotifier(),
          ),


        ],
        child: const MyApps()
    ));
  }, FirebaseCrashlytics.instance.recordError
  );

}

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireBase',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Tables and Stats',
            style: TextStyle(
                color: appBarIconColor
            )
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  navigateTablesAndStatsDetails(context);
                },
                child: const Center(
                    child: Text(
                      'Export to Excel',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),

            const SizedBox(height: 60,),


          ],
        ),
      ));
  }

  Future navigateTablesAndStatsDetails(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigator()));
  }

}