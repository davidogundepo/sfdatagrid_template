import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfdatagrid_template/main.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


Color backgroundColor = Colors.indigo[400];
Color appBarIconColor = Colors.indigo[200];
Color appBarBackgroundColor = Colors.indigo[400];
Color secondStudentChartColor = Colors.indigo[400];


class TablesAndStatsDetails extends StatefulWidget {
  const TablesAndStatsDetails({Key key}) : super(key: key);

  @override
  State<TablesAndStatsDetails> createState() => _TablesAndStatsDetailsState();
}

class _TablesAndStatsDetailsState extends State<TablesAndStatsDetails> {


  List<TablesAndStats> tablesAndStatsList = [];

  TablesAndStatsDataSource tablesAndStatsDataSource;

  Stream<QuerySnapshot> getDataFromFirestore() {
    return FirebaseFirestore.instance.collection('TablesAndStatss').orderBy('goals_scored', descending: true).snapshots();
  }


  _buildDataGrid() {
    return
      StreamBuilder(
          stream: getDataFromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (var data in snapshot.data.docs) {
                tablesAndStatsList.add(TablesAndStats(
                    id: data['id'],
                    playerName: data['player_name'],
                    matchesPlayed: data['matches_played'],
                    goalsScored: data['goals_scored'],
                    assists: data['assists'],
                    playerPosition: data['player_position'],
                    yellowCard: data['yellow_card'],
                    redCard: data['red_card'],
                    nationality: data['nationality']
                ));
              }
              tablesAndStatsDataSource = TablesAndStatsDataSource(tablesAndStatsList);

              return SizedBox(
                height: 700,
                child: Material(
                  color: secondStudentChartColor,
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                        sortIcon: const Icon(Icons.arrow_circle_up),
                        sortIconColor: Colors.white,
                        headerColor: Colors.indigo[400],
                        gridLineColor: Colors.indigo[200], gridLineStrokeWidth: 1.0
                    ),
                    child: SfDataGrid(
                      source: tablesAndStatsDataSource,
                      frozenColumnsCount: 2,
                      frozenRowsCount: 0,
                      allowSorting: true,
                      allowTriStateSorting: true,
                      columnWidthMode: ColumnWidthMode.fill,
                      tableSummaryRows: [
                        GridTableSummaryRow(
                            color: Colors.indigo[400],
                            showSummaryInRow: true,
                            title: '{Goals} Goals and {Ass} Assists by {Count} players so far.',
                            columns: [
                              const GridSummaryColumn(
                                  name: 'Goals',
                                  columnName: 'goals_scored',
                                  summaryType: GridSummaryType.sum
                              ),
                              const GridSummaryColumn(
                                  name: 'Ass',
                                  columnName: 'assists',
                                  summaryType: GridSummaryType.sum
                              ),
                              const GridSummaryColumn(
                                  name: 'Count',
                                  columnName: 'assists',
                                  summaryType: GridSummaryType.count
                              ),


                            ],
                            position: GridTableSummaryRowPosition.bottom
                        )
                      ],
                      columns: getColumns,
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      );
  }

  List<GridColumn> get getColumns {

    return <GridColumn>[
      GridColumn(
          columnName: 'id',
          width: 50,
          label: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text('ID',
                style: TextStyle(
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'player_name',
          width: 120,
          label: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: const Text('Player Name',
                softWrap: true,
                style: TextStyle(
                    color: Colors.white
                ),
                overflow: TextOverflow.fade,
              ))),
      GridColumn(
          columnName: 'matches_played',
          width: 50,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('  MP',//'Matches Played',
                  style: TextStyle(
                      color: Colors.white
                  ),
                  overflow: TextOverflow.ellipsis))),
      GridColumn(
          columnName: 'goals_scored',
          allowSorting: true,
          width: 50,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('GS',//'Goals Scored'
                style: TextStyle(
                    color: Colors.white
                ),
              ))),
      GridColumn(
          columnName: 'assists',
          width: 50,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('A', //'Assists'
                style: TextStyle(
                    color: Colors.white
                ),
              ))),
      GridColumn(
          columnName: 'yellow_card',
          width: 50,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('YC', //'Yellow\nCard'
                style: TextStyle(
                    color: Colors.white
                ),
              ))),
      GridColumn(
          columnName: 'red_card',
          width: 50,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('RC', //'Red\nCard'
                style: TextStyle(
                    color: Colors.white
                ),
              ))),
      GridColumn(
          columnName: 'player_position',
          width: 60,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('PP', //'Player Position'
                style: TextStyle(
                    color: Colors.white
                ),
              ))),
      GridColumn(
          columnName: 'nationality',
          width: 120,
          label: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Nationality',
                style: TextStyle(
                  color: Colors.white,
                ),
                overflow: TextOverflow.fade,
              ))),
    ];
  }

  @override
  void initState() {
    getDataFromFirestore();

    tablesAndStatsDataSource = TablesAndStatsDataSource(tablesAndStatsList);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
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
              Navigator.of(context).pop(false);
              navigateMyApp(context);
            },
          ),
          elevation: 10,
          backgroundColor: appBarBackgroundColor,
        ),
        body: Container(
            child: _buildDataGrid()
        ),
      ),
    );


  }

  Future navigateMyApp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  Future<bool> _onWillPop() {
    return Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

}

class TablesAndStatsDataSource extends DataGridSource {

  TablesAndStatsDataSource(this.tablesAndStatsList) {
    sort();
    _buildDataRow();
  }

  List<TablesAndStats> tablesAndStatsList = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  /// Creates the tablesAndStats data source class with required details.

  void _buildDataRow() {
    int itemCount = 1;

    dataGridRows = tablesAndStatsList
        .map<DataGridRow>((e) => DataGridRow(cells: [

      DataGridCell<int>(columnName: 'id', value: itemCount++),
      DataGridCell<String>(columnName: 'player_name', value: e.playerName),
      DataGridCell<int>(columnName: 'matches_played', value: int.parse(e.matchesPlayed)),
      // DataGridCell<int>(columnName: 'goals_scored', value: int.parse(e.goalsScored)),
      DataGridCell<int>(columnName: 'goals_scored', value: e.goalsScored),
      DataGridCell<int>(columnName: 'assists', value: int.parse(e.assists)),
      DataGridCell<int>(columnName: 'yellow_card', value: int.parse(e.yellowCard)),
      DataGridCell<int>(columnName: 'red_card', value: int.parse(e.redCard)),
      DataGridCell<String>(columnName: 'player_position', value: e.playerPosition),
      DataGridCell<String>(columnName: 'nationality', value: e.nationality),


    ])).toList();
  }

  @override
  Widget buildTableSummaryCellWidget(GridTableSummaryRow summaryRow, GridSummaryColumn summaryColumn, RowColumnIndex rowColumnIndex, String summaryValue) {
    // TODO: implement buildTableSummaryCellWidget
    return Container(
      padding: const EdgeInsets.all(15.0),
      // child: Text(summaryValue),
      child: Text(summaryValue,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white),),

    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.indigo[300],
        cells: row.getCells().map<Widget>((e) {
          TextStyle getTextStyle() {
            if (e.columnName == 'goals_scored') {
              return const TextStyle(color: Colors.white54);
            }
            else if (e.columnName == 'nationality') {
              return const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic);
            }
            else {
              return const TextStyle(color: Colors.white);
            }
          }
          return Container(
            alignment: (e.columnName == 'id' || e.columnName == 'playerName')
                ? Alignment.center : Alignment.centerLeft,
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value.toString(),
              style: getTextStyle(),
              // overflow: TextOverflow.ellipsis,
            ),
          );
          // Container(
          //   alignment: Alignment.centerRight,
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     NumberFormat.currency(locale: 'en_US', symbol: r'$')
          //         .format(row.getCells()[7].value)
          //         .toString(),
          //     overflow: TextOverflow.ellipsis,
          //   ),
          // ),
        }).toList());
  }

}

class TablesAndStats{

  String id;
  String playerName;
  String matchesPlayed;
  int goalsScored;
  String assists;
  String playerPosition;
  String yellowCard;
  String redCard;
  String nationality;



  TablesAndStats
      (
      {
        this.id,
        this.playerName,
        this.matchesPlayed,
        this.goalsScored,
        this.assists,
        this.playerPosition,
        this.yellowCard,
        this.redCard,
        this.nationality
      }
      );

}