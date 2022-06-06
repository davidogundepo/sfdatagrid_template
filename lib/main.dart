import 'dart:async';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'model/TablesAndStats.dart';
import 'notifier/tables_and_stats_notifier.dart';
import 'package:provider/provider.dart';

Color backgroundColor = const Color.fromRGBO(120, 97, 128, 1.0);
Color appBarIconColor = const Color.fromRGBO(158, 134, 169, 1.0);
Color appBarBackgroundColor = const Color.fromRGBO(99, 78, 107, 1.0);
Color secondStudentChartColor = const Color.fromRGBO(53, 73, 95, 1.0);


TablesAndStatsNotifier tablesAndStatsNotifier;


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runZonedGuarded(() {
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
          create: (context) => TablesAndStatsNotifier(),
          ),
        ],
        child: const MyApp()
    ));
  }, FirebaseCrashlytics.instance.recordError
  );
}

class MyApp extends StatefulWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  List<TablesAndStats> tablesAndStatsList = [];

  TablesAndStatsDataSource tablesAndStatsDataSource;

  @override
  void initState() {

    tablesAndStatsNotifier = Provider.of<TablesAndStatsNotifier>(context, listen: false);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tables and Stats',
              style: TextStyle(
                  color: appBarIconColor
              )
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 10,
          backgroundColor: appBarBackgroundColor,
        ),
        body: Container(
          height: 700,
          child: Material(
            color: secondStudentChartColor,
            child: SfDataGrid(
              source: tablesAndStatsDataSource,
              frozenColumnsCount: 2,
              frozenRowsCount: 0,
              allowSorting: true,
              columnWidthMode: ColumnWidthMode.fill,
              columns: <GridColumn>[
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.id,
                    width: 40,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'ID',
                        ))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.playerName,
                    width: 100,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Player\nName'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.matchesPlayed.toString(),
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Matches\nPlayed',
                          overflow: TextOverflow.ellipsis,
                        ))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.goalsScored.toString(),
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Goals\nScored'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.assists.toString(),
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Assists'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.playerPosition,
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Player\nPosition'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.yellowCard.toString(),
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Yellow\nCard'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.redCard.toString(),
                    width: 70,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Red\nCard'))),
                GridColumn(
                    columnName: tablesAndStatsNotifier.currentTablesAndStats.nationality,
                    width: 80,
                    label: Container(
                        alignment: Alignment.center,
                        child: const Text('Nationality '))),
              ],
            ),
          ),
        )

    );
  }

}

class TablesAndStatsDataSource extends DataGridSource {

  TablesAndStatsDataSource(this.tablesAndStatsList) {
    FirebaseFirestore.instance.collection('TablesAndStats');
    _buildDataRow();
  }


  List<TablesAndStats> tablesAndStatsList = [];

  List<DataGridRow> dataGridRows = [];


  @override
  List<DataGridRow> get rows => dataGridRows;

  /// Creates the tablesAndStats data source class with required details.

  _buildDataRow() {
    dataGridRows = tablesAndStatsList
        .map<DataGridRow>((e) => DataGridRow(cells: [

      DataGridCell<String>(columnName: tablesAndStatsNotifier.currentTablesAndStats.id, value: e.id),
      DataGridCell<String>(columnName: tablesAndStatsNotifier.currentTablesAndStats.playerName, value: e.playerName),
      DataGridCell<int>(columnName: tablesAndStatsNotifier.currentTablesAndStats.matchesPlayed.toString(), value: e.matchesPlayed),
      DataGridCell<int>(columnName: tablesAndStatsNotifier.currentTablesAndStats.goalsScored.toString(), value: e.goalsScored),
      DataGridCell<int>(columnName: tablesAndStatsNotifier.currentTablesAndStats.assists.toString(), value: e.assists),
      DataGridCell<String>(columnName: tablesAndStatsNotifier.currentTablesAndStats.playerPosition, value: e.playerPosition),
      DataGridCell<int>(columnName: tablesAndStatsNotifier.currentTablesAndStats.yellowCard.toString(), value: e.yellowCard),
      DataGridCell<int>(columnName: tablesAndStatsNotifier.currentTablesAndStats.redCard.toString(), value: e.redCard),
      DataGridCell<String>(columnName: tablesAndStatsNotifier.currentTablesAndStats.nationality, value: e.nationality),

    ]))
        .toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value.toString(),
              style: const TextStyle(
                  color: Colors.black
              ),
            ),
          );
        }).toList());
  }


}
