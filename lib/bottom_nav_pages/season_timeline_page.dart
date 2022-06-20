
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SeasonTimeline extends StatefulWidget {
  const SeasonTimeline({Key key}) : super(key: key);

  @override
  State<SeasonTimeline> createState() => _SeasonTimelineState();
}

class _SeasonTimelineState extends State<SeasonTimeline> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFE7ECEF);
    Offset distance = isPressed ? const Offset(2, -2) : const Offset(2, -2);
    double blur = isPressed ? 7.0 : 24.0;
    

    return Scaffold(

      backgroundColor: Colors.green[300],

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 120, bottom: 120),
          child: Stack(
            children: [

              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .43,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                      "assets/images/curry_champion.jpeg",
                    fit: BoxFit.cover,
                    color: Colors.teal,
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
                            'sense',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                          ),
                          Text(
                            'sense 2 years',
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
                            'sense',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                          ),
                          Text(
                            'sense 2 years',
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
                            'sense',
                            style: TextStyle(
                              color: Colors.white70
                            ),
                          ),
                          Text(
                            'sense 2 years',
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
        ),
      ),

    );
  }
}
