
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
      // backgroundColor: Colors.grey[850],
      backgroundColor: Colors.deepPurple[300],
      // backgroundColor: backgroundColor,
      body: Center(

        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: Colors.deepPurple.withAlpha(30),
                  offset: const Offset(4.0, 2.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0
              ),
              BoxShadow(
                  color: Colors.deepPurple.withAlpha(60),
                  offset: const Offset(-2.0, -1.0),
                  blurRadius: 1.0,
                  spreadRadius: 1.0
              )
            ]
          ),
          child: Center(
            child: Listener(
              onPointerUp: (_) => setState(() => isPressed = false),
              onPointerDown: (_) => setState(() => isPressed = true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple[500],
                      offset: -distance,
                      blurRadius: blur,
                      spreadRadius: 1.0
                    ),
                    BoxShadow(
                      color: Colors.deepPurple[200],
                      offset: distance,
                      blurRadius: blur,
                      spreadRadius: 1.0
                    ),
                  ],
                ),

                // child: Listener(
                //   onPointerUp: (_) => setState(() => isPressed = false),
                //   onPointerDown: (_) => setState(() => isPressed = true),
                //   child: AnimatedContainer(
                //     duration: const Duration(milliseconds: 100),
                //     width: 200,
                //     height: 150,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(30),
                //       color: backgroundColor,
                //       boxShadow: [
                //         BoxShadow(
                //           blurRadius: blur,
                //           offset: -distance,
                //           color: Colors.white,
                //           inset: isPressed
                //         ),
                //         BoxShadow(
                //           blurRadius: blur,
                //           offset: -distance,
                //           color: const Color(0xFFA7A9AF),
                //           inset: isPressed
                //         ),
                //
                //       ]
                //     ),
                //     child: const AvatarGlow(
                //       endRadius: 100,
                //       glowColor: Colors.deepPurple,
                //       duration: Duration(milliseconds: 2000),
                //       repeatPauseDuration: Duration(milliseconds: 100),
                //       child: Icon(Icons.airplay,
                //           size: 80,
                //           color: Colors.white
                //       ),
                //     ),
                //     // child: const SizedBox(height: 50, width: 50),
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
