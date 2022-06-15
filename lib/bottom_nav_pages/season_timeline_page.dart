
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SeasonTimeline extends StatefulWidget {
  const SeasonTimeline({Key key}) : super(key: key);

  @override
  State<SeasonTimeline> createState() => _SeasonTimelineState();
}

class _SeasonTimelineState extends State<SeasonTimeline> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: Colors.grey[850],
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: InkWell(
          onTap: (){},
          child: Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              // color: Colors.grey[850],
              color: Colors.deepPurple[300],
              borderRadius: const BorderRadius.all(Radius.circular(15)),
                // shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // color: Colors.grey[900],
                  color: Colors.deepPurple[700],
                  offset: const Offset(4.0, 2.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0
                ),
                BoxShadow(
                  // color: Colors.grey[800],
                  color: Colors.deepPurple[200],
                  offset: const Offset(-2.0, -1.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0
                ),
              ],
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     Colors.deepPurple.shade200,
              //     Colors.deepPurple.shade400
              //   ],
              //   stops: const [
              //     0,
              //     1,
              //   ],
              // ),
            ),
            child: const AvatarGlow(
              endRadius: 500,
              glowColor: Colors.deepPurple,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              child: Icon(Icons.pl,
                  size: 80,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
