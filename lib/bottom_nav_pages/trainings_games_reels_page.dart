
import 'package:flutter/material.dart';
import 'package:sfdatagrid_template/api/trainings_games_reels_api.dart';
import 'package:sfdatagrid_template/notifier/trainings_games_reels_notifier.dart';
import 'package:transparent_image/transparent_image.dart';
import'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../main.dart';
import 'bottom_navigator.dart';
import 'package:line_icons/line_icons.dart';

class TrainingsAndGamesReelsPage extends StatelessWidget implements PreferredSizeWidget {

  // final Function onPressed;
  // final Function onTitleTapped;

  @override
  final Size preferredSize;

  const TrainingsAndGamesReelsPage(
      {Key key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    trainingsAndGamesReelsNotifier = Provider.of<TrainingsAndGamesReelsNotifier>(context);
    getTrainingsAndGamesReels(trainingsAndGamesReelsNotifier);

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              itemCount: trainingsAndGamesReelsNotifier.trainingsAndGamesReelsList.length,
              itemBuilder: _buildReels,
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            },

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Hero(
                  tag: 'trainingsAndGamesReelsPageBtn',
                  child: Card(
                    elevation: 10,
                    shape: kBackButtonShape,
                    child: IconButton(
                      alignment: Alignment.center,
                      // splashColor: Colors.orange.withOpacity(4),
                      splashColor: Colors.orange.withAlpha(50),
                      color: Colors.teal,
                      icon: const Icon(LineIcons.chevronCircleLeft),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        navigateMyApp(context);
                      },
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
                      onTap: (){},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        child: const Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              'Monthly Reels',//ADD FOOTBALL ICON
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
          ),

        ],
      ),
    );
  }

  Future navigateMyApp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
  }


  Widget _buildReels(BuildContext context, int index) {
    // TrainingsAndGamesReelsNotifier trainingsAndGamesReelsNotifier = Provider.of<TrainingsAndGamesReelsNotifier>(context);

    return InkWell(

      child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                  Radius.circular(15)
              ),
              image: DecorationImage(
                  alignment: const Alignment(0, -1),
                  image: CachedNetworkImageProvider(
                      trainingsAndGamesReelsNotifier.trainingsAndGamesReelsList[index].image
                  ),
                  fit: BoxFit.cover
              )
          ),
      ),
      onTap: (){},
      splashColor: Colors.deepOrangeAccent,
    );
  }
}

// class TrainingsAndGamesReelsPage extends StatefulWidget implements PreferredSizeWidget {
//
//   final Function onPressed;
//   final Function onTitleTapped;
//
//   @override
//   final Size preferredSize;
//
//   const TrainingsAndGamesReelsPage({Key key, @required this.onPressed, this.onTitleTapped})
//       : preferredSize = const Size.fromHeight(60.0),
//         super(key: key);
//
//   @override
//   State<TrainingsAndGamesReelsPage> createState() => _TrainingsAndGamesReelsPageState();
//
// }
//
// class _TrainingsAndGamesReelsPageState extends State<TrainingsAndGamesReelsPage> {
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
//                     onPressed: () {  },
//                     // onPressed: onPressed,
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
//                     // onTap: onTitleTapped,
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
//
//           Container(),
//         ],
//       ),
//     );
//   }
// }

ShapeBorder kBackButtonShape = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);


