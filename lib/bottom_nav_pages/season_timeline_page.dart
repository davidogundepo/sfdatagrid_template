
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../notifier/player_of_the_month_stats_info_notifier.dart';

class SeasonTimeline extends StatefulWidget {
  const SeasonTimeline({Key key}) : super(key: key);

  @override
  State<SeasonTimeline> createState() => _SeasonTimelineState();
}

class _SeasonTimelineState extends State<SeasonTimeline> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider.of<PlayerOfTheMonthStatsAndInfoNotifier>(context);


    const backgroundColor = Color(0xFFE7ECEF);
    Offset distance = isPressed ? const Offset(2, -2) : const Offset(2, -2);
    double blur = isPressed ? 7.0 : 24.0;
    

    return Scaffold(

      backgroundColor: Colors.green[300],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 120, bottom: 120),
          child:
          ListView.builder(
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
                      child: Container(
                        width: MediaQuery.of(context).size.width * .43,
                        height: MediaQuery.of(context).size.height * 2,

                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     alignment: const Alignment(0, -1),
                        //     image: Image(image: CachedNetworkImageProvider(
                        //       playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].image,
                        //     )),
                        //     fit: BoxFit.cover,
                        //   ),
                          // shape: BoxShape.rectangle,
                        // ),
                        child: Image(

                          // "assets/images/curry_champion.jpeg",
                          image: CachedNetworkImageProvider(
                            playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].image,
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
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'sense 1',
                                  style: TextStyle(
                                      color: Colors.white70,
                                    fontSize: 30
                                  ),
                                ),
                                Text(
                                  // 'sense 1 years',
                                  playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].playerName,
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 30
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'sense 2',
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                ),
                                Text(
                                  playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].playerPosition,
                                  style: TextStyle(
                                      color: Colors.white70
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                            Column(
                              children: [
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
                    ),
                  ],
                    ),
          )
        ),
      ),

    );
  }
}
