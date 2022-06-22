
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    PlayerOfTheMonthStatsAndInfoNotifier playerOfTheMonthStatsAndInfoNotifier = Provider
        .of<PlayerOfTheMonthStatsAndInfoNotifier>(context);

    return Scaffold(

      backgroundColor: Colors.green[300],

      body: SafeArea(

        child: Center(

          child: Container(
            width: 200,
            height: 200,
            color: Colors.brown,
            child: MaterialButton(
              onPressed: ()
              {
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
                                                  playerOfTheMonthStatsAndInfoNotifier.playerOfTheMonthStatsAndInfoList[index].image,
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
                                                          .playerName,
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
                                                          .playerPosition,
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
                                  child: Align(
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
      ),
    );
  }

  @override
  void initState() {

    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

}
