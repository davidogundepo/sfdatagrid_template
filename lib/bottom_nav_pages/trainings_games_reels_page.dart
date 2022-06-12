
import 'package:flutter/material.dart';

// class TrainingsAndGamesReelsPage extends StatelessWidget implements PreferredSizeWidget {
//
//   final Function onPressed;
//   final Function onTitleTapped;
//
//   @override
//   final Size preferredSize;
//
//   const TrainingsAndGamesReelsPage(
//       {Key key, @required this.onPressed, this.onTitleTapped})
//       : preferredSize = const Size.fromHeight(60.0),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: <Widget>[
//           // SizedBox(height: 30,),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Hero(
//                 tag: 'trainingsAndGamesReelsPageBtn',
//                 child: Card(
//                   elevation: 10,
//                   shape: kBackButtonShape,
//                   child: MaterialButton(
//                     height: 50,
//                     minWidth: 50,
//                     elevation: 10,
//                     shape: kBackButtonShape,
//                     onPressed: onPressed,
//                     // child: child,
//                   ),
//                 ),
//               ),
//               // SizedBox(
//               //   width: 50,
//               // ),
//               Hero(
//                 tag: 'title',
//                 transitionOnUserGestures: true,
//                 child: Card(
//                   elevation: 10,
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(30),
//                     ),
//                   ),
//                   child: InkWell(
//                     onTap: onTitleTapped,
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width / 1.5,
//                       height: 50,
//                       child: const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: EdgeInsets.only(left: 30),
//                           child: Text(
//                             'Monthly Reels',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25,
//                               // color: Colors.black54,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
// }


ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = const Icon(
  Icons.arrow_back_ios,
  color: Colors.black54,
);

class TrainingsAndGamesReelsPage extends StatefulWidget implements PreferredSizeWidget {


  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  const TrainingsAndGamesReelsPage({Key key, @required this.onPressed, this.onTitleTapped})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  State<TrainingsAndGamesReelsPage> createState() => _TrainingsAndGamesReelsPageState();
}

class _TrainingsAndGamesReelsPageState extends State<TrainingsAndGamesReelsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'trainingsAndGamesReelsPageBtn',
                child: Card(
                  elevation: 10,
                  shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 50,
                    minWidth: 50,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: () {  },
                    // onPressed: onPressed,
                    // child: child,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: InkWell(
                    // onTap: onTitleTapped,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Monthly Reels',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
