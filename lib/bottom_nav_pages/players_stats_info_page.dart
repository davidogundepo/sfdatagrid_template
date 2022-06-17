
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sfdatagrid_template/api/most_assists_player_stats_info_api.dart';
import 'package:sfdatagrid_template/api/most_fouled_rc_players_stats_info_api.dart';
import 'package:sfdatagrid_template/api/most_fouled_yc_players_stats_info_api.dart';
import 'package:sfdatagrid_template/api/player_of_the_month_stats_info_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfdatagrid_template/api/top_goals_players_stats_info_api.dart';
import 'package:sfdatagrid_template/notifier/most_assists_players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/most_fouled_rc_players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/most_fouled_yc_players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/player_of_the_month_stats_info_notifier.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:clay_containers/clay_containers.dart';
import '../main.dart';
import '../notifier/top_goals_players_stats_info_notifier.dart';


TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier;
MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier;
MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier;
MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier;
PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier;




Color backgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(21, 29, 59, 2);
Color appBarIconColor = Colors.white;
Color modalColor = Colors.transparent;
Color modalBackgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(49, 63, 117, 1.0);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color borderColor = Colors.black;


Map<int, Widget> playersTGPAndMAP;



var _playerPositionTGP;
var _preferredFootTGP;
var _playerNameTGP;
var _goalsScoredTGP;
var _matchesPlayedTGP;
var _playerImageTGP;

var _playerPositionMAP;
var _preferredFootMAP;
var _playerNameMAP;
var _asssistsCreatedMAP;
var _matchesPlayedMAP;
var _playerImageMAP;

var _yellowCard;
var _ycPlayerName;
var _ycPlayerImage;

var _redCard;
var _rcPlayerName;
var _rcPlayerImage;

var _potmName;
var _potmGoals;
var _potmAssists;
var _potmMatchesPlayed;
var _potmImage;


class PlayersStatsAndInfoPage extends StatefulWidget {

  const PlayersStatsAndInfoPage({Key key}) : super(key: key);

  @override
  State<PlayersStatsAndInfoPage> createState() => _PlayersStatsAndInfoPageState();

}

class _PlayersStatsAndInfoPageState extends State<PlayersStatsAndInfoPage> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  int sharedValue = 0;

  // Widget _buildProductItem(BuildContext context, int index) {
  //   PrimarySchoolGraduatingClassANotifier primarySchoolGraduatingClassANotifier = Provider.of<PrimarySchoolGraduatingClassANotifier>(context);
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
  //       ),
  //
  //       child: Material(
  //         color: materialBackgroundColor,
  //         child: InkWell(
  //           splashColor: splashColor,
  //           onTap: () {
  //             primarySchoolGraduatingClassANotifier.currentPrimarySchoolGraduatingClassA = primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index];
  //             navigateToSubPage(context);
  //           },
  //
  //           child: SingleChildScrollView(
  //             scrollDirection: Axis.horizontal,
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Container(
  //                   width: 100,
  //                   height: 100,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
  //                       image: DecorationImage(
  //                           alignment: Alignment(0, -1),
  //                           image: CachedNetworkImageProvider(
  //                               primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].image
  //                           ),
  //                           fit: BoxFit.cover
  //                       )
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 40),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 20),
  //                         child: Row(
  //                           children: <Widget>[
  //                             Text(
  //                                 primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].name,
  //                                 style: GoogleFonts.tenorSans(
  //                                     color: textColor,
  //                                     fontSize: 17,
  //                                     fontWeight: FontWeight.w600
  //                                 )
  //                             ),
  //                             (() {
  //                               if (primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].prefect == "Yes") {
  //                                 return
  //                                   Row(
  //                                     children: <Widget>[
  //                                       SizedBox(width: 10),
  //                                       Icon (
  //                                         MdiIcons.shieldCheck,
  //                                         color: iconColor,
  //                                       ),
  //                                     ],
  //                                   );
  //                               } else {
  //                                 return Visibility(
  //                                   visible: !_isVisible,
  //                                   child: Icon (
  //                                     MdiIcons.shieldCheck,
  //                                     color: iconColor,
  //                                   ),
  //                                 );
  //                               }
  //                             }()),
  //                           ],
  //                         ),
  //
  //                       ),
  //                       (() {
  //                         if (primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram.toString().isNotEmpty) {
  //                           if (!primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram.toString().contains("@")) {
  //                             return Padding(
  //                               padding: const EdgeInsets.only(top: 10),
  //                               child: Text(
  //                                   primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram == primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram ? '@'+primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram : primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram,
  //                                   style: GoogleFonts.varela(
  //                                       color: textColorTwo,
  //                                       fontStyle: FontStyle.italic
  //                                   )
  //                               ),
  //                             );
  //                           }
  //                           else {
  //                             return Padding(
  //                               padding: const EdgeInsets.only(top: 10),
  //                               child: Text(
  //                                   primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram,
  //                                   style: GoogleFonts.varela(
  //                                       color: textColorTwo,
  //                                       fontStyle: FontStyle.italic
  //                                   )
  //                               ),
  //                             );
  //                           }
  //                         } else {
  //                           return Visibility(
  //                             visible: !_isVisible,
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(top: 10),
  //                               child: Text(
  //                                   primarySchoolGraduatingClassANotifier.primarySchoolGraduatingClassAList[index].instagram,
  //                                   style: GoogleFonts.varela(
  //                                       color: textColorTwo,
  //                                       fontStyle: FontStyle.italic
  //                                   )
  //                               ),
  //                             ),
  //                           );
  //                         }
  //                       }()),
  //                     ],
  //                   ),
  //                 )
  //
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }




  @override
  Widget build(BuildContext context) {


    TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier = Provider.of<TopGoalsPlayersStatsAndInfoNotifier>(context);
    // _playerPositionTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.playerPosition;


    MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier = Provider.of<MostAssistsPlayersStatsAndInfoNotifier>(context);

    MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier = Provider.of<MostFouledYCPlayersStatsAndInfoNotifier>(context);

    MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier = Provider.of<MostFouledRCPlayersStatsAndInfoNotifier>(context, listen: true);

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context);



    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Material(
                      color: Colors.white70,
                      child: IconButton(
                          onPressed: (){
                            Navigator.of(context).pop(false);
                            navigateMyApp(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_outlined)
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    const Text(
                      'Coventry Phoenix'
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Padding(
                padding: EdgeInsets.only(left: 22),
                child: Text(
                  'Top Goal Scorer',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * 0.7,
                            height: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Swiper(
                              autoplay: true,
                              viewportFraction: 0.8,
                              scale: 0.9,
                              itemCount: topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList.length,
                              itemBuilder: (context, index) =>
                                  // Card(
                                  //     elevation: 10,
                                  //     color: Colors.blue,
                                  //     shape: const RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.only(
                                  //           topRight: Radius.circular(70.0),
                                  //           bottomLeft: Radius.circular(7.0),
                                  //           bottomRight: Radius.circular(7.0),
                                  //           topLeft: Radius.circular(7.0),
                                  //
                                  //         )
                                  //     ),
                                      // child: ListView.builder(
                                      // itemCount: topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList.length,
                                      // itemBuilder: (context, index) =>
                                      //child:
                              Padding(
                                padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                child: ClayContainer(
                                  width: MediaQuery.of(context).size.width * 0.90,
                                  emboss: true,
                                  spread: 1,
                                  color: Colors.teal,
                                  depth: -29,
                                  // borderRadius: 75,
                                  curveType: CurveType.concave,
                                  customBorderRadius: const BorderRadius.only(
                                      topRight: Radius.elliptical(70, 70),
                                      bottomLeft: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Stack(
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Card(
                                              color: Colors.tealAccent,
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(
                                                  //     fit: BoxFit.cover,
                                                  //     image: AssetImage('assets/images/carer.jpeg')
                                                  // )
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('position'),
                                                Text(//'OkYY',
                                                    topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].playerName
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: 50
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const <Widget>[
                                                Text('preferred foot'),
                                                Text('Left'),
                                              ],
                                            ),
                                            const SizedBox(
                                                height: 50
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Text('name'),
                                                    Text('data 3a')
                                                  ],
                                                ),
                                                const SizedBox(
                                                    width: 20
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Text('goals'),
                                                    Text('data 4a')
                                                  ],
                                                ),
                                                const SizedBox(
                                                    width: 20
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: const <Widget>[
                                                    Text('matches played'),
                                                    Text('data 5a')
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                      // child: Column(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: <Widget>[
                                      //     Column(
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: const <Widget>[
                                      //         Text('data 1'),
                                      //         Text('data 1a'),
                                      //       ],
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 10
                                      //     ),
                                      //     Column(
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       children: const <Widget>[
                                      //         Text('data 2'),
                                      //         Text('data 2a'),
                                      //       ],
                                      //     ),
                                      //     const SizedBox(
                                      //         height: 30
                                      //     ),
                                      //     Row(
                                      //       crossAxisAlignment: CrossAxisAlignment.start,
                                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      //       children: <Widget>[
                                      //         Column(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: const <Widget>[
                                      //             Text('data 3'),
                                      //             Text('data 3a')
                                      //           ],
                                      //         ),
                                      //         const SizedBox(
                                      //             width: 20
                                      //         ),
                                      //         Column(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: const <Widget>[
                                      //             Text('data 4'),
                                      //             Text('data 4a')
                                      //           ],
                                      //         ),
                                      //         const SizedBox(
                                      //             width: 20
                                      //         ),
                                      //         Column(
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: const <Widget>[
                                      //             Text('data 5'),
                                      //             Text('data 5a')
                                      //           ],
                                      //         )
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),
                                    ),
                                    // ),
                                  ),
                                ),
                              ),
                                  // ),
                              itemWidth: MediaQuery.of(context).size.width * 0.9,
                              layout: SwiperLayout.DEFAULT,
                            ),
                          ),

                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 6, bottom: 15),
                                child: Text('Most Yellow Card Fouled Players'),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>

                                  ((){
                                    if (mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.isNotEmpty) {
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: <Widget>[

                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Card(
                                                    elevation: 5,
                                                    shadowColor: Colors.teal,
                                                    color: Colors.blue,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(70.0),
                                                          bottomLeft: Radius.circular(7.0),
                                                          bottomRight: Radius.circular(7.0),
                                                          topLeft: Radius.circular(7.0),

                                                        )
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        // mainAxisSize: MainAxisSize.min,
                                                        children: <Widget>[
                                                          const Text('Yellow Cards'),
                                                          const Text('data2'),
                                                          const SizedBox(
                                                              height: 40
                                                          ),
                                                          Text(//'Okay'
                                                              mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                                          // Text('data2'),

                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ),
                                              Card(
                                                color: Colors.teal,
                                                child: Container(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    // image: DecorationImage(
                                                    //     fit: BoxFit.cover,
                                                    //     image: AssetImage('assets/images/carer.jpeg')
                                                    // )
                                                  ),
                                                ),
                                              ),
                                            ],

                                          ),
                                          const SizedBox(width: 20),

                                        ],
                                      );
                                    }
                                    else {
                                      Visibility(
                                        visible: !_isVisible,
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: <Widget>[

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Card(
                                                      elevation: 5,
                                                      shadowColor: Colors.teal,
                                                      color: Colors.blue,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(70.0),
                                                            bottomLeft: Radius.circular(7.0),
                                                            bottomRight: Radius.circular(7.0),
                                                            topLeft: Radius.circular(7.0),

                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          // mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            const Text('Yellow Cards'),
                                                            const Text('data2'),
                                                            const SizedBox(
                                                                height: 40
                                                            ),
                                                            Text(//'Okay'
                                                                mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                                            // Text('data2'),

                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ),
                                                Card(
                                                  color: Colors.teal,
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // image: DecorationImage(
                                                      //     fit: BoxFit.cover,
                                                      //     image: AssetImage('assets/images/carer.jpeg')
                                                      // )
                                                    ),
                                                  ),
                                                ),
                                              ],

                                            ),
                                            const SizedBox(width: 20),

                                          ],
                                        ),
                                      );
                                    }

                                  }()),

                                  //     Row(
                                  //   // crossAxisAlignment: CrossAxisAlignment.center,
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Stack(
                                  //       children: <Widget>[
                                  //
                                  //         Padding(
                                  //           padding: const EdgeInsets.all(8.0),
                                  //           child: Card(
                                  //               elevation: 5,
                                  //               shadowColor: Colors.teal,
                                  //               color: Colors.blue,
                                  //               shape: const RoundedRectangleBorder(
                                  //                   borderRadius: BorderRadius.only(
                                  //                     topRight: Radius.circular(70.0),
                                  //                     bottomLeft: Radius.circular(7.0),
                                  //                     bottomRight: Radius.circular(7.0),
                                  //                     topLeft: Radius.circular(7.0),
                                  //
                                  //                   )
                                  //               ),
                                  //               child: Padding(
                                  //                 padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                  //                 child: Column(
                                  //                   mainAxisAlignment: MainAxisAlignment.start,
                                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                                  //                   // mainAxisSize: MainAxisSize.min,
                                  //                   children: <Widget>[
                                  //                     const Text('Yellow Cards'),
                                  //                     const Text('data2'),
                                  //                     const SizedBox(
                                  //                         height: 40
                                  //                     ),
                                  //                     Text(//'Okay'
                                  //                         mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                  //                     // Text('data2'),
                                  //
                                  //                   ],
                                  //                 ),
                                  //               )
                                  //           ),
                                  //         ),
                                  //         Card(
                                  //           color: Colors.teal,
                                  //           child: Container(
                                  //             width: 70.0,
                                  //             height: 70.0,
                                  //             decoration: const BoxDecoration(
                                  //               shape: BoxShape.circle,
                                  //               // image: DecorationImage(
                                  //               //     fit: BoxFit.cover,
                                  //               //     image: AssetImage('assets/images/carer.jpeg')
                                  //               // )
                                  //             ),
                                  //           ),
                                  //         ),
                                  //       ],
                                  //
                                  //     ),
                                  //     const SizedBox(width: 20),
                                  //
                                  //   ],
                                  // ),
                                  itemWidth: 250,
                                  layout: SwiperLayout.STACK,


                                //   ((){
                                //   // if (mostFouledYCPlayersStatsAndInfoNotifier.currentMostFouledYCPlayersStatsAndInfo.yellowCard.toString().isNotEmpty){
                                //   if (mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.length){
                                //     return Row(
                                //         // crossAxisAlignment: CrossAxisAlignment.center,
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           Stack(
                                //             children: <Widget>[
                                //
                                //               Padding(
                                //                 padding: const EdgeInsets.all(8.0),
                                //                 child: Card(
                                //                     elevation: 5,
                                //                     shadowColor: Colors.teal,
                                //                     color: Colors.blue,
                                //                     shape: const RoundedRectangleBorder(
                                //                         borderRadius: BorderRadius.only(
                                //                           topRight: Radius.circular(70.0),
                                //                           bottomLeft: Radius.circular(7.0),
                                //                           bottomRight: Radius.circular(7.0),
                                //                           topLeft: Radius.circular(7.0),
                                //
                                //                         )
                                //                     ),
                                //                     child: Padding(
                                //                       padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                //                       child: Column(
                                //                         mainAxisAlignment: MainAxisAlignment.start,
                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                //                         // mainAxisSize: MainAxisSize.min,
                                //                         children: <Widget>[
                                //                           const Text('Yellow Cards'),
                                //                           const Text('data2'),
                                //                           const SizedBox(
                                //                               height: 40
                                //                           ),
                                //                           Text(//'Okay'
                                //                               mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                //                           // Text('data2'),
                                //
                                //                         ],
                                //                       ),
                                //                     )
                                //                 ),
                                //               ),
                                //               Card(
                                //                 color: Colors.teal,
                                //                 child: Container(
                                //                   width: 70.0,
                                //                   height: 70.0,
                                //                   decoration: const BoxDecoration(
                                //                     shape: BoxShape.circle,
                                //                     // image: DecorationImage(
                                //                     //     fit: BoxFit.cover,
                                //                     //     image: AssetImage('assets/images/carer.jpeg')
                                //                     // )
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //
                                //           ),
                                //           const SizedBox(width: 20),
                                //
                                //         ],
                                //       );
                                //
                                //     // );
                                //   }
                                //   else {
                                //     Visibility(
                                //       visible: !_isVisible,
                                //       child: Swiper(
                                //         autoplay: true,
                                //         viewportFraction: 0.8,
                                //         scale: 0.9,
                                //         itemCount: mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.length,
                                //         itemBuilder: (context, index) =>  Row(
                                //           // crossAxisAlignment: CrossAxisAlignment.center,
                                //           mainAxisAlignment: MainAxisAlignment.center,
                                //           children: [
                                //             Stack(
                                //               children: <Widget>[
                                //
                                //                 Padding(
                                //                   padding: const EdgeInsets.all(8.0),
                                //                   child: Card(
                                //                       elevation: 5,
                                //                       shadowColor: Colors.teal,
                                //                       color: Colors.blue,
                                //                       shape: const RoundedRectangleBorder(
                                //                           borderRadius: BorderRadius.only(
                                //                             topRight: Radius.circular(70.0),
                                //                             bottomLeft: Radius.circular(7.0),
                                //                             bottomRight: Radius.circular(7.0),
                                //                             topLeft: Radius.circular(7.0),
                                //
                                //                           )
                                //                       ),
                                //                       child: Padding(
                                //                         padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                //                         child: Column(
                                //                           mainAxisAlignment: MainAxisAlignment.start,
                                //                           crossAxisAlignment: CrossAxisAlignment.start,
                                //                           // mainAxisSize: MainAxisSize.min,
                                //                           children: <Widget>[
                                //                             const Text('Yellow Cards'),
                                //                             const Text('data2'),
                                //                             const SizedBox(
                                //                                 height: 40
                                //                             ),
                                //                             Text(//'Okay'
                                //                                 mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                //                             // Text('data2'),
                                //
                                //                           ],
                                //                         ),
                                //                       )
                                //                   ),
                                //                 ),
                                //                 Card(
                                //                   color: Colors.teal,
                                //                   child: Container(
                                //                     width: 70.0,
                                //                     height: 70.0,
                                //                     decoration: const BoxDecoration(
                                //                       shape: BoxShape.circle,
                                //                       // image: DecorationImage(
                                //                       //     fit: BoxFit.cover,
                                //                       //     image: AssetImage('assets/images/carer.jpeg')
                                //                       // )
                                //                     ),
                                //                   ),
                                //                 ),
                                //               ],
                                //
                                //             ),
                                //             const SizedBox(width: 20),
                                //
                                //           ],
                                //         ),
                                //         itemWidth: 250,
                                //         layout: SwiperLayout.STACK,
                                //       ),
                                //     );
                                //   }
                                //
                                // }()),




                                // Swiper(
                                //   autoplay: true,
                                //   viewportFraction: 0.8,
                                //   scale: 0.9,
                                //   itemCount: mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.length,
                                //   itemBuilder: (context, index) =>  Row(
                                //     // crossAxisAlignment: CrossAxisAlignment.center,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //             Stack(
                                //           children: <Widget>[
                                //
                                //             Padding(
                                //               padding: const EdgeInsets.all(8.0),
                                //               child: Card(
                                //                   elevation: 5,
                                //                   shadowColor: Colors.teal,
                                //                   color: Colors.blue,
                                //                   shape: const RoundedRectangleBorder(
                                //                       borderRadius: BorderRadius.only(
                                //                         topRight: Radius.circular(70.0),
                                //                         bottomLeft: Radius.circular(7.0),
                                //                         bottomRight: Radius.circular(7.0),
                                //                         topLeft: Radius.circular(7.0),
                                //
                                //                       )
                                //                   ),
                                //                   child: Padding(
                                //                     padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                //                     child: Column(
                                //                       mainAxisAlignment: MainAxisAlignment.start,
                                //                       crossAxisAlignment: CrossAxisAlignment.start,
                                //                       // mainAxisSize: MainAxisSize.min,
                                //                       children: <Widget>[
                                //                         const Text('Yellow Cards'),
                                //                         const Text('data2'),
                                //                         const SizedBox(
                                //                             height: 40
                                //                         ),
                                //                         Text(//'Okay'
                                //                             mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName),
                                //                         // Text('data2'),
                                //
                                //                       ],
                                //                     ),
                                //                   )
                                //               ),
                                //             ),
                                //             Card(
                                //               color: Colors.teal,
                                //               child: Container(
                                //                 width: 70.0,
                                //                 height: 70.0,
                                //                 decoration: const BoxDecoration(
                                //                   shape: BoxShape.circle,
                                //                   // image: DecorationImage(
                                //                   //     fit: BoxFit.cover,
                                //                   //     image: AssetImage('assets/images/carer.jpeg')
                                //                   // )
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //
                                //         ),
                                //       const SizedBox(width: 20),
                                //
                                //     ],
                                //   ),
                                //   itemWidth: 250,
                                //   layout: SwiperLayout.STACK,
                                // ),
                              ),
                              )],
                          ),

                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 6, bottom: 15),
                                child: Text('Most Red Card Fouled Players'),
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: <Widget>[

                                      SizedBox(
                                        height: 220,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 140,
                                            height: 160,
                                            child: Card(
                                                elevation: 5,
                                                shadowColor: Colors.teal,
                                                color: Colors.blue,
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(70.0),
                                                      bottomLeft: Radius.circular(7.0),
                                                      bottomRight: Radius.circular(7.0),
                                                      topLeft: Radius.circular(7.0),

                                                    )
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: const <Widget>[
                                                      Text('Red Cards'),
                                                      Text('data2'),
                                                      SizedBox(
                                                          height: 40
                                                      ),
                                                      Text('Name2 Surname2'),
                                                      // Text('data2'),

                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.teal.withOpacity(0.5),
                                        child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            // image: DecorationImage(
                                            //     fit: BoxFit.cover,
                                            //     image: AssetImage('assets/images/carer.jpeg')
                                            // )
                                          ),
                                        ),
                                      ),

                                    ],

                                  ),
                                  const SizedBox(width: 20),

                                ],
                              ),
                            ],
                          ),




                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                        color:  Colors.teal,
                        child: Center(
                            child: ClayContainer(
                              color:  Colors.teal,
                              height: 200,
                              width: 200,
                              depth: -29,
                              curveType: CurveType.concave,
                              child: ClayText(
                                "Seize the Clay!",
                                emboss: true,
                                size: 40,
                                textColor: Colors.teal,
                                color: Colors.teal,


                              ),
                            ),
                        ),
                      ),
                          ),



                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),


      ),
    );
  }

  Future navigateMyApp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  @override
  initState() {

    TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier = Provider.of<TopGoalsPlayersStatsAndInfoNotifier>(context, listen: false);
    // _playerPositionTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.playerPosition;
    // _preferredFootTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.preferredFoot;
    // _playerNameTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.playerName;
    // _goalsScoredTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.goalsScored;
    // _matchesPlayedMAP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.matchesPlayed;
    // _playerImageTGP = topGoalsPlayersStatsAndInfoNotifier.currentTopGoalsPlayersStatsAndInfo.image;

    MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier = Provider.of<MostAssistsPlayersStatsAndInfoNotifier>(context, listen: false);
    // _playerPositionMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.playerPosition;
    // _preferredFootMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.preferredFoot;
    // _playerNameMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.playerName;
    // _asssistsCreatedMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.assists;
    // _matchesPlayedMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.matchesPlayed;
    // _playerImageMAP = mostAssistsPlayersStatsAndInfoNotifier.currentMostAssistsPlayersStatsAndInfo.image;

    MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier = Provider.of<MostFouledYCPlayersStatsAndInfoNotifier>(context, listen: false);
    // _yellowCard = mostFouledYCPlayersStatsAndInfoNotifier.currentMostFouledYCPlayersStatsAndInfo.yellowCard;
    // _ycPlayerName = mostFouledYCPlayersStatsAndInfoNotifier.currentMostFouledYCPlayersStatsAndInfo.playerName;
    // _ycPlayerImage = mostFouledYCPlayersStatsAndInfoNotifier.currentMostFouledYCPlayersStatsAndInfo.image;

    MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier = Provider.of<MostFouledRCPlayersStatsAndInfoNotifier>(context, listen: false);
    // _redCard = mostFouledRCPlayersStatsAndInfoNotifier.currentMostFouledRCPlayersStatsAndInfo.redCard;
    // _rcPlayerName = mostFouledRCPlayersStatsAndInfoNotifier.currentMostFouledRCPlayersStatsAndInfo.playerName;
    // _rcPlayerImage = mostFouledRCPlayersStatsAndInfoNotifier.currentMostFouledRCPlayersStatsAndInfo.image;

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context, listen: false);
    // _potmName = playerOfTheMonthStatsAndInfoNotifier.currentPlayerOfTheMonthStatsAndInfo.playerName;
    // _potmMatchesPlayed = playerOfTheMonthStatsAndInfoNotifier.currentPlayerOfTheMonthStatsAndInfo.matchesPlayed;
    // _potmGoals = playerOfTheMonthStatsAndInfoNotifier.currentPlayerOfTheMonthStatsAndInfo.goalsScored;
    // _potmAssists = playerOfTheMonthStatsAndInfoNotifier.currentPlayerOfTheMonthStatsAndInfo.assists;
    // _potmImage = playerOfTheMonthStatsAndInfoNotifier.currentPlayerOfTheMonthStatsAndInfo.image;


    getTopGoalsPlayersStatsAndInfo(topGoalsPlayersStatsAndInfoNotifier);
    getMostAssistsPlayersStatsAndInfo(mostAssistsPlayersStatsAndInfoNotifier);
    getMostFouledYCPlayersStatsAndInfo(mostFouledYCPlayersStatsAndInfoNotifier);
    getMostFouledRCPlayersStatsAndInfo(mostFouledRCPlayersStatsAndInfoNotifier);
    getPlayerOfTheMonthStatsAndInfo(playerOfTheMonthStatsAndInfoNotifier);

    super.initState();
  }

}
