import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfdatagrid_template/bottom_nav_pages/players_table_page.dart';
import 'package:sfdatagrid_template/notifier/players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/trainings_games_reels_notifier.dart';
// import 'package:sfdatagrid_template/api/trainings_games_reels_api.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'bottom_nav_pages/bottom_navigator.dart';
// import 'model/TrainingsAndGamesReels.dart';
// import 'notifier/trainings_games_reels_notifier.dart';
import 'package:provider/provider.dart';

Color backgroundColor = Colors.indigo[400];
Color appBarIconColor = Colors.indigo[200];
Color appBarBackgroundColor = Colors.indigo[400];
Color secondStudentChartColor = Colors.indigo[400];


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZonedGuarded(() {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TrainingsAndGamesReelsNotifier(),
          ),
          ChangeNotifierProvider(
            create: (context) => PlayersStatsAndInfoNotifier(),
          ),
        ],
        child: const MyApps()
    ));
  }, FirebaseCrashlytics.instance.recordError
  );

}

class MyApps extends StatelessWidget {
  const MyApps({Key key}) : super(key: key);

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

  const MyApp({Key key}) : super(key: key);

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
          ],
        ),
      ));
  }

  Future navigateTablesAndStatsDetails(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigator()));
  }

}