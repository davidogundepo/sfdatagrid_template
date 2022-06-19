
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
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Card(
                margin: EdgeInsets.all(20),
                child: Image.asset("assets/images/curry_ed.png"),
              ),
              Container(
                width: 100,
                height: 200,
                child: Card(
                  color: Colors.transparent,
                  // margin: EdgeInsets.all(20),
                  child: Image.asset("assets/images/curry.jpeg"),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
