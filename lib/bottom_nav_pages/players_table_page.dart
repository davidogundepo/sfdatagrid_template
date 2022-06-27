import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfdatagrid_template/main.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';


Color backgroundColor = Colors.indigo[400];
Color appBarIconColor = Colors.indigo[200];
Color appBarBackgroundColor = Colors.indigo[400];
Color secondStudentChartColor = Colors.indigo[400];


class PlayersTablePage extends StatefulWidget {
  const PlayersTablePage({Key key}) : super(key: key);

  @override
  State<PlayersTablePage> createState() => _PlayersTablePageState();
}

class _PlayersTablePageState extends State<PlayersTablePage> {


  List<PlayersTable> playersTableList = [];

  PlayersTableDataSource playersTableDataSource;

  Stream<QuerySnapshot> getDataFromFirestore() {
    return FirebaseFirestore.instance.collection('PlayersTable').orderBy('goals_scored', descending: true).snapshots();
  }


  _buildDataGrid() {
    return
      StreamBuilder(
          stream: getDataFromFirestore(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (playersTableList.isNotEmpty) {
                realTimeUpdate(var data) {
                  return DataGridRow(cells: [
                    DataGridCell<String>(columnName: 'id', value: data.doc['id']),
                    DataGridCell<String>(columnName: 'image', value: data.doc['image']),
                    DataGridCell<String>(columnName: 'player_name',
                        value: data.doc['player_name']),
                    DataGridCell<int>(columnName: 'matches_played',
                        value: data.doc['matches_played']),
                    DataGridCell<int>(columnName: 'goals_scored',
                        value: data.doc['goals_scored']),
                    DataGridCell<int>(columnName: 'assists',
                        value: data.doc['assists']),
                    DataGridCell<int>(columnName: 'yellow_card',
                        value: data.doc['yellow_card']),
                    DataGridCell<int>(columnName: 'red_card',
                        value: data.doc['red_card']),
                    DataGridCell<String>(columnName: 'player_position',
                        value: data.doc['player_position']),
                    DataGridCell<String>(columnName: 'nationality',
                        value: data.doc['nationality']),
                  ]);
                }
                for (var data in snapshot.data.docChanges) {
                  if (data.type == DocumentChangeType.modified) {
                    playersTableDataSource.dataGridRows[data.oldIndex] =
                        realTimeUpdate(data);
                    playersTableDataSource.updateDataGridSource();
                  } else if (data.type == DocumentChangeType.added) {
                    playersTableDataSource.dataGridRows.add(realTimeUpdate(data));
                    playersTableDataSource.updateDataGridSource();

                  } else if (data.type == DocumentChangeType.removed) {
                    playersTableDataSource.dataGridRows.removeAt(data.oldIndex);
                    playersTableDataSource.updateDataGridSource();
                  }
                }
              } else {
                for (var data in snapshot.data.docs) {
                  playersTableList.add(PlayersTable(
                      id: data['id'],
                      image: data['image'],
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
                playersTableDataSource = PlayersTableDataSource(playersTableList);
              }

              return SizedBox(
                height: 700,
                child: Material(
                  color: secondStudentChartColor,
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                        sortIcon: const Icon(Icons.arrow_circle_up),
                        sortIconColor: Colors.white,
                        headerColor: Colors.indigo[400],
                        gridLineColor: Colors.indigo[200],
                        gridLineStrokeWidth: 1.0
                    ),
                    child: SfDataGrid(
                      rowHeight: 50,
                      source: playersTableDataSource,
                      frozenColumnsCount: 3,
                      frozenRowsCount: 0,
                      allowSorting: true,
                      allowTriStateSorting: true,
                      // allowMultiColumnSorting: true,
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
                                  columnName: 'id',
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
          width: 35,
          label: Container(
              alignment: Alignment.center,
              // padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text('ID',
                style: TextStyle(
                    color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'image',
          width: 70,
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text('Image',
              style: TextStyle(
              color: Colors.white
              ),
              overflow: TextOverflow.ellipsis))),
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
                overflow: TextOverflow.ellipsis,
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
                    color: Colors.white54,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
              ))),
    ];
  }

  @override
  void initState() {
    getDataFromFirestore();
    playersTableDataSource = PlayersTableDataSource(playersTableList);
    playersTableDataSource.sortedColumns.add(
        const SortColumnDetails(name: 'goals_scored',
            sortDirection: DataGridSortDirection.ascending
    ));
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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

class PlayersTableDataSource extends DataGridSource {

  PlayersTableDataSource(this.playersTableList) {
    sort();
    _buildDataRow();
  }

  List<PlayersTable> playersTableList = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  /// Creates the playersTable data source class with required page.

  void _buildDataRow() {
    int itemCount = 1;

    dataGridRows = playersTableList
        .map<DataGridRow>((e) => DataGridRow(cells: [

      DataGridCell<int>(columnName: 'id', value: itemCount++),
      DataGridCell<String>(columnName: 'image', value: e.image),
      DataGridCell<String>(columnName: 'player_name', value: e.playerName),
      DataGridCell<int>(columnName: 'matches_played', value: e.matchesPlayed),
      DataGridCell<int>(columnName: 'goals_scored', value: e.goalsScored),
      DataGridCell<int>(columnName: 'assists', value: e.assists),
      DataGridCell<int>(columnName: 'yellow_card', value: e.yellowCard),
      DataGridCell<int>(columnName: 'red_card', value: e.redCard),
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
            color: Colors.white)
      ),

    );
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.indigo[300],
        cells: row.getCells().map<Widget>((e) {
          TextStyle getTextStyle() {
            if (e.columnName == 'goals_scored') {
              return const TextStyle(color: Colors.white54, fontWeight: FontWeight.bold);
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
          return e.columnName == 'image'
              ?
          Container(
            margin: const EdgeInsets.all(2),
            alignment: Alignment.center,
            // width: 25,
            // height: 25,
            decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                // borderRadius: const BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    alignment: const Alignment(1, -1.1),
                    image: CachedNetworkImageProvider(
                        e.value,
                    ),
                    fit: BoxFit.cover
                )
            ),

          )
              :
          Container(
            alignment: (e.columnName == 'id' || e.columnName == 'playerName')
                ? Alignment.center : Alignment.centerLeft,
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              e.value.toString(),
              style: getTextStyle(),
              overflow: TextOverflow.fade,
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

  void updateDataGridSource() {
    notifyListeners();
  }
}

class PlayersTable{

  String id;
  String image;
  String playerName;
  int matchesPlayed;
  int goalsScored;
  int assists;
  String playerPosition;
  int yellowCard;
  int redCard;
  String nationality;


  PlayersTable
      (
      {
        this.id,
        this.image,
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