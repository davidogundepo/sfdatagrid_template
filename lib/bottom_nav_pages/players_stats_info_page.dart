
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sfdatagrid_template/notifier/cum_motm_players_stats_info_notifier.dart';
import 'package:sfdatagrid_template/notifier/motm_players_stats_info_notifier.dart';
import '../api/top_defensive_players_stats_info_api.dart';
import '../api/top_gk_players_stats_info_api.dart';
import '../api/most_assists_players_stats_info_api.dart';
import '../api/most_fouled_rc_players_stats_info_api.dart';
import '../api/most_fouled_yc_players_stats_info_api.dart';
import '../api/player_of_the_month_stats_info_api.dart';
import '../api/top_goals_players_stats_info_api.dart';
import '../notifier/most_assists_players_stats_info_notifier.dart';
import '../notifier/most_fouled_rc_players_stats_info_notifier.dart';
import '../notifier/most_fouled_yc_players_stats_info_notifier.dart';
import '../notifier/player_of_the_month_stats_info_notifier.dart';
import '../notifier/top_defensive_players_stats_info_notifier.dart';
import '../notifier/top_gk_players_stats_info_notifier.dart';
import '../notifier/top_goals_players_stats_info_notifier.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:clay_containers/clay_containers.dart';
import '../main.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';


late TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier;
late MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier;
late MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier;
late MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier;
late PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier;
late TopGKPlayersStatsAndInfoNotifier topGKPlayersStatsAndInfoNotifier;
late TopDefensivePlayersStatsAndInfoNotifier topDefensivePlayersStatsAndInfoNotifier;
late MOTMPlayersStatsAndInfoNotifier motmPlayersStatsAndInfoNotifier;
late CumMOTMPlayersStatsAndInfoNotifier cumMOTMPlayersStatsAndInfoNotifier;




Color? backgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color? appBarTextColor = Colors.white;
Color? appBarBackgroundColor = Color.fromRGBO(21, 29, 59, 2);
Color? appBarIconColor = Colors.white;
Color? modalColor = Colors.transparent;
Color? modalBackgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color? materialBackgroundColor = Colors.transparent;
Color? cardBackgroundColor = Colors.white;
Color? splashColor = const Color.fromRGBO(49, 63, 117, 1.0);
Color? iconColor = Colors.white;
Color? textColor = Colors.white;
Color? textColorTwo = Colors.white70;
Color? dialogBackgroundColor = Color.fromRGBO(21, 29, 59, 1);
Color? borderColor = Colors.black;


late Map<int, Widget> playersTGPAndMAP;



class PlayersStatsAndInfoPage extends StatefulWidget {

  const PlayersStatsAndInfoPage({Key? key}) : super(key: key);

  @override
  State<PlayersStatsAndInfoPage> createState() => _PlayersStatsAndInfoPageState();

}

class _PlayersStatsAndInfoPageState extends State<PlayersStatsAndInfoPage> {

  bool isPressed = false;

  bool _isVisible = true;

  int itemCount = 1;

  String yes = 'Yes Yes';
  String yesCount = '1';

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      itemCount++;
    });
  }


  late SwiperController swiperController;

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

    Offset distance = isPressed ? const Offset(2, -2) : const Offset(2, -2);
    double blur = isPressed ? 7.0 : 24.0;


    TopGoalsPlayersStatsAndInfoNotifier topGoalsPlayersStatsAndInfoNotifier = Provider.of<TopGoalsPlayersStatsAndInfoNotifier>(context);

    MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier = Provider.of<MostAssistsPlayersStatsAndInfoNotifier>(context);

    TopGKPlayersStatsAndInfoNotifier topGKPlayersStatsAndInfoNotifier = Provider.of<TopGKPlayersStatsAndInfoNotifier>(context);

    TopDefensivePlayersStatsAndInfoNotifier topDefensivePlayersStatsAndInfoNotifier = Provider.of<TopDefensivePlayersStatsAndInfoNotifier>(context);

    MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier = Provider.of<MostFouledYCPlayersStatsAndInfoNotifier>(context, listen: true);

    MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier = Provider.of<MostFouledRCPlayersStatsAndInfoNotifier>(context, listen: true);

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context);

    MOTMPlayersStatsAndInfoNotifier motmPlayersStatsAndInfoNotifier = Provider.of<MOTMPlayersStatsAndInfoNotifier>(context);

    CumMOTMPlayersStatsAndInfoNotifier cumMOTMPlayersStatsAndInfoNotifier = Provider.of<CumMOTMPlayersStatsAndInfoNotifier>(context);



    return Scaffold(
      backgroundColor: Colors.teal[300],
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Top 10 Goal Scorers',

                                ),
                              ),
                              Container(
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
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                (topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].image)!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('position'),
                                                        Text((topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].playerPosition)!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('preferred foot'),
                                                        Text((topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].preferredFoot)!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('name'),
                                                              Text(topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].playerName!),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('goals'),
                                                              Text(topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].goalsScored.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('matches'),
                                                              Text('${topGoalsPlayersStatsAndInfoNotifier.topGoalsPlayersStatsAndInfoList[index].matchesPlayed} played'),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Top 10 Most Assists Players',

                                ),
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('position'),
                                                        Text(mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].playerPosition!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('preferred foot'),
                                                        Text(mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].preferredFoot!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('name'),
                                                              Text(mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].playerName!),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('Assists'),
                                                              Text(mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].assists.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('matches'),
                                                              Text('${mostAssistsPlayersStatsAndInfoNotifier.mostAssistsPlayersStatsAndInfoList[index].matchesPlayed} played'),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 22, bottom: 15),
                                child: Text('8 Most Yellow Carded Players'),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Center(
                                  child: Swiper(
                                    autoplay: true,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                    itemCount: mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList.length,
                                    itemBuilder: (context, index) =>
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: <Widget>[

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ClayContainer(
                                                      emboss: true,
                                                      spread: 1,
                                                      color: Colors.teal,
                                                      depth: 49,
                                                      curveType: CurveType.concave,
                                                      customBorderRadius: const BorderRadius.only(
                                                          topRight: Radius.circular(70),
                                                          bottomLeft: Radius.circular(7),
                                                          topLeft: Radius.circular(7),
                                                          bottomRight: Radius.circular(7)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            const Text(
                                                              'Yellow Cards',
                                                            ),
                                                            Text(mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].yellowCard.toString()),

                                                            const SizedBox(
                                                                height: 5
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 40.0),
                                                              child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: Colors.white70
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text(
                                                                    (index+1).toString(),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 15
                                                            ),
                                                            Text(
                                                                mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].playerName!
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            )

                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ),
                                                ClayContainer(
                                                  emboss: true,
                                                  spread: 1,
                                                  color: Colors.teal,
                                                  depth: 49,
                                                  // borderRadius: 75,
                                                  curveType: CurveType.concave,
                                                  customBorderRadius: const BorderRadius.all(Radius.circular(40)
                                                  ),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                mostFouledYCPlayersStatsAndInfoNotifier.mostFouledYCPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ],

                                            ),
                                            const SizedBox(width: 20),

                                          ],
                                        ),
                                    control: const SwiperControl(
                                      color: Colors.blue
                                    ),
                                    itemWidth: 250,
                                    layout: SwiperLayout.STACK,
                                  ),
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20, left: 22, bottom: 15),
                                child: Text('8 Most Red Carded Players'),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: Center(
                                  child: Swiper(
                                    autoplay: true,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                    itemCount: mostFouledRCPlayersStatsAndInfoNotifier.mostFouledRCPlayersStatsAndInfoList.length,
                                    itemBuilder: (context, index) =>
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: <Widget>[

                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: ClayContainer(
                                                      emboss: true,
                                                      spread: 1,
                                                      color: Colors.teal,
                                                      depth: 49,
                                                      curveType: CurveType.concave,
                                                      customBorderRadius: const BorderRadius.only(
                                                          topRight: Radius.circular(70),
                                                          bottomLeft: Radius.circular(7),
                                                          topLeft: Radius.circular(7),
                                                          bottomRight: Radius.circular(7)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left: 8, right: 8, top: 70),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: <Widget>[
                                                            const Text(
                                                              'Red Cards',
                                                            ),
                                                            Text(mostFouledRCPlayersStatsAndInfoNotifier.mostFouledRCPlayersStatsAndInfoList[index].redCard.toString()),

                                                            const SizedBox(
                                                                height: 5
                                                            ),

                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 40.0),
                                                              child: Container(
                                                                decoration: const BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: Colors.white70
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text(
                                                                    (index+1).toString(),
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 15
                                                            ),
                                                            Text(
                                                                mostFouledRCPlayersStatsAndInfoNotifier.mostFouledRCPlayersStatsAndInfoList[index].playerName!
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            )

                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ),
                                                ClayContainer(
                                                  emboss: true,
                                                  spread: 1,
                                                  color: Colors.teal,
                                                  depth: 49,
                                                  // borderRadius: 75,
                                                  curveType: CurveType.concave,
                                                  customBorderRadius: const BorderRadius.all(Radius.circular(40)
                                                  ),
                                                  child: Container(
                                                    width: 70.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.transparent,
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                mostFouledRCPlayersStatsAndInfoNotifier.mostFouledRCPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ],

                                            ),
                                            const SizedBox(width: 20),

                                          ],
                                        ),

                                    control: const SwiperControl(
                                        color: Colors.blue
                                    ),
                                    itemWidth: 250,
                                    layout: SwiperLayout.STACK,
                                  ),
                                ),
                              ),
                              const SizedBox (
                                height: 40,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Top Goal Keepers',

                                ),
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('position'),
                                                        Text(topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].playerPosition!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('name'),
                                                        Text(topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].playerName!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('Goals Conceded'),
                                                              Text(topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].goalsConcededGkDef.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('Clean Sheets'),
                                                              Text(topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].cleanSheetGk.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text(
                                                                'matches',
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                              Text(
                                                                '${topGKPlayersStatsAndInfoNotifier.topGKPlayersStatsAndInfoList[index].matchesPlayed} played',
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  // itemHeight: 300,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Top 10 Defensive Players',

                                ),
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('position'),
                                                        Text(topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].playerPosition!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('preferred foot'),
                                                        Text(topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].preferredFoot!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('name'),
                                                              Text(topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].playerName!),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('Goals Conceded'),
                                                              Text(topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].goalsConcededGkDef.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('matches'),
                                                              Text('${topDefensivePlayersStatsAndInfoNotifier.topDefensivePlayersStatsAndInfoList[index].matchesPlayed} played'),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Weekly MOTM Players',

                                ),
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('position'),
                                                        Text(motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].playerPosition!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('preferred foot'),
                                                        Text(motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].preferredFoot!),
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
                                                          children: <Widget>[
                                                            const Text('name'),
                                                            Text(motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].playerName!),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            width: 20
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          // children: <Widget>[
                                                            // const Text('Assists'),
                                                            // Text(motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].assists.toString()),
                                                          // ],
                                                        ),
                                                        const SizedBox(
                                                            width: 20
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            const Text('matches'),
                                                            Text('${motmPlayersStatsAndInfoNotifier.mOTMPlayersStatsAndInfoList[index].matchesPlayed} played'),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22),
                                child: Text(
                                  'Most Awarded MOTM Players',

                                ),
                              ),
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  scale: 0.9,
                                  itemCount: cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList.length,
                                  itemBuilder: (context, index) =>
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18, bottom: 18, left: 8, right: 8),
                                        child: ClayContainer(
                                          width: MediaQuery.of(context).size.width * 0.90,
                                          emboss: true,
                                          spread: 1,
                                          color: Colors.teal,
                                          depth: -29,
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
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            alignment: const Alignment(0, -1),
                                                            image: CachedNetworkImageProvider(
                                                                cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].image!
                                                            ),
                                                            fit: BoxFit.cover
                                                        ),
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(10),
                                                          bottomLeft: Radius.circular(10),
                                                          topRight: Radius.circular(10),
                                                          bottomRight: Radius.circular(10),
                                                        ),
                                                        shape: BoxShape.rectangle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 50.0, top: 40),
                                                  child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.white70
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          (index+1).toString(),
                                                          textAlign: TextAlign.center,
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
                                                        const Text('Coventry Phoenix FC'),
                                                        Text(cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].playerPosition!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        const Text('Preferred Foot'),
                                                        Text(cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].preferredFoot!),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                        height: 50
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('Name'),
                                                              Text(cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].playerName!),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('MOTM Count'),
                                                              Text(cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].cumMOTMCount.toString()),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 20
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: <Widget>[
                                                              const Text('matches'),
                                                              Text('${cumMOTMPlayersStatsAndInfoNotifier.cumMOTMPlayersStatsAndInfoList[index].matchesPlayed} played'),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                  itemWidth: MediaQuery.of(context).size.width * 0.9,
                                  layout: SwiperLayout.DEFAULT,
                                ),
                              ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 22, bottom: 22),
                                child: Text(
                                  'Player of the month',

                                ),
                              ),
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.90,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[300],
                                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.teal.withAlpha(30),
                                            offset: const Offset(4.0, 2.0),
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0
                                        ),
                                        BoxShadow(
                                            color: Colors.teal.withAlpha(60),
                                            offset: const Offset(-2.0, -1.0),
                                            blurRadius: 1.0,
                                            spreadRadius: 1.0
                                        )
                                      ]
                                  ),
                                  child: GestureDetector(
                                    child: Center(
                                      child: Listener(
                                        onPointerUp: (_) => setState(() => isPressed = false),
                                        onPointerDown: (_) => setState(() => isPressed = true),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 200),
                                          width: 200,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: Colors.teal[300],
                                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.teal[500]!,
                                                  offset: -distance,
                                                  blurRadius: blur,
                                                  spreadRadius: 1.0
                                              ),
                                              BoxShadow(
                                                  color: Colors.teal[200]!,
                                                  offset: distance,
                                                  blurRadius: blur,
                                                  spreadRadius: 1.0
                                              ),
                                            ],
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'YAY!',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 60,
                                                  shadows: [
                                                    const Shadow(
                                                        offset: Offset(3, 3),
                                                        color: Colors.black38,
                                                        blurRadius: 10),
                                                    Shadow(
                                                        offset: const Offset(-3, -3),
                                                        color: Colors.teal[300]!,
                                                        blurRadius: 10
                                                    )
                                                  ],
                                                  color: Colors.teal[300]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            Stack (
                                              children: [
                                                AlertDialog(
                                                  shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                  ),
                                                  contentPadding: const EdgeInsets.all(10),
                                                  backgroundColor: Colors.teal,
                                                  content: SizedBox(
                                                    width: MediaQuery.of(context).size.width,
                                                    height: MediaQuery.of(context).size.height * 0.6,
                                                    child: ListView.builder(
                                                      itemExtent: MediaQuery.of(context).size.height * 0.585,

                                                      shrinkWrap: true,
                                                      itemCount: playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList.length,
                                                      itemBuilder: (context, index) =>
                                                          Stack(
                                                            alignment: AlignmentDirectional.topStart,
                                                            // fit: StackFit.loose,
                                                            children: [
                                                              Align(
                                                                alignment: Alignment.centerLeft,
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(context).size.width * .43,
                                                                  height: MediaQuery.of(context).size.height * 2,
                                                                  child: Image(
                                                                    height: double.infinity,
                                                                    width: double.infinity,
                                                                    image: CachedNetworkImageProvider(
                                                                      playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].image!,
                                                                      scale: 0.2,
                                                                    ),
                                                                    fit: BoxFit.cover,
                                                                    color: Colors.grey,
                                                                    colorBlendMode: BlendMode.softLight,
                                                                    alignment: const Alignment(0.4, -1),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment.centerRight,
                                                                child: SizedBox(
                                                                  // color: Colors.green,
                                                                  height: MediaQuery.of(context).size.height,
                                                                  // height: 500,
                                                                  width: MediaQuery.of(context).size.width,
                                                                  child: Image.asset(
                                                                    "assets/images/back_field.png",
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment.topRight,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  children: [
                                                                    Column(
                                                                      children: [
                                                                        const Text(
                                                                          'sense 1',
                                                                          style: TextStyle(
                                                                              color: Colors.white70,
                                                                              fontSize: 30
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          // 'sense 1 years',
                                                                          playerOfTheMonthStatsAndInfoNotifier
                                                                              .playerOfTheMonthStatsAndInfoList[index]
                                                                              .playerName!,
                                                                          style: const TextStyle(
                                                                              color: Colors.white70,
                                                                              fontSize: 30
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 30),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        const Text(
                                                                          'sense 2',
                                                                          style: TextStyle(
                                                                              color: Colors.white70
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          playerOfTheMonthStatsAndInfoNotifier
                                                                              .playerOfTheMonthStatsAndInfoList[index]
                                                                              .playerPosition!,
                                                                          style: const TextStyle(
                                                                              color: Colors.white70
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 30),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      children: const [
                                                                        Text(
                                                                          'sense 3',
                                                                          style: TextStyle(
                                                                              color: Colors.white70
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'sense 3 years',

                                                                          style: TextStyle(
                                                                              color: Colors.white70
                                                                          ),
                                                                        ),

                                                                        SizedBox(height: 30),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: MediaQuery.of(context).size.height * 0.175,
                                                  right: MediaQuery.of(context).size.width * 0.13,
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey[200],
                                                        shape: BoxShape.rectangle,
                                                        borderRadius: BorderRadius.circular(6.0),
                                                      ),
                                                      child: const Align(
                                                        alignment: Alignment.center,
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.teal,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 20),
                              //   child: Container(
                              //     color:  Colors.teal,
                              //     child: Center(
                              //       child: ClayContainer(
                              //         color:  Colors.teal,
                              //         height: 200,
                              //         width: 200,
                              //         depth: -29,
                              //         curveType: CurveType.concave,
                              //         child: ClayText(
                              //           "Seize the Clay!",
                              //           emboss: true,
                              //           size: 40,
                              //           textColor: Colors.teal,
                              //           color: Colors.teal,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox (
                                height: 50,
                              ),
                            ],
                          )
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

    MostAssistsPlayersStatsAndInfoNotifier mostAssistsPlayersStatsAndInfoNotifier = Provider.of<MostAssistsPlayersStatsAndInfoNotifier>(context, listen: false);

    MostFouledYCPlayersStatsAndInfoNotifier mostFouledYCPlayersStatsAndInfoNotifier = Provider.of<MostFouledYCPlayersStatsAndInfoNotifier>(context, listen: false);

    MostFouledRCPlayersStatsAndInfoNotifier mostFouledRCPlayersStatsAndInfoNotifier = Provider.of<MostFouledRCPlayersStatsAndInfoNotifier>(context, listen: false);

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context, listen: false);

    TopGKPlayersStatsAndInfoNotifier topGKPlayersStatsAndInfoNotifier = Provider.of<TopGKPlayersStatsAndInfoNotifier>(context, listen: false);

    TopDefensivePlayersStatsAndInfoNotifier topDefensivePlayersStatsAndInfoNotifier = Provider.of<TopDefensivePlayersStatsAndInfoNotifier>(context, listen: false);


    getTopGoalsPlayersStatsAndInfo(topGoalsPlayersStatsAndInfoNotifier);
    getMostAssistsPlayersStatsAndInfo(mostAssistsPlayersStatsAndInfoNotifier);
    getMostFouledYCPlayersStatsAndInfo(mostFouledYCPlayersStatsAndInfoNotifier);
    getMostFouledRCPlayersStatsAndInfo(mostFouledRCPlayersStatsAndInfoNotifier);
    getPlayerOfTheMonthStatsAndInfo(playerOfTheMonthStatsAndInfoNotifier);
    getTopGKPlayersStatsAndInfo(topGKPlayersStatsAndInfoNotifier);
    getTopDefensivePlayersStatsAndInfo(topDefensivePlayersStatsAndInfoNotifier);

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

  }

}
