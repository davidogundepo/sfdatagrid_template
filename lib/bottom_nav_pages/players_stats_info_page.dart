
import 'package:flutter/material.dart';

import '../main.dart';


class PlayersStatsAndInfoPage extends StatefulWidget {
  const PlayersStatsAndInfoPage({Key key}) : super(key: key);

  @override
  State<PlayersStatsAndInfoPage> createState() => _PlayersStatsAndInfoPageState();

}

class _PlayersStatsAndInfoPageState extends State<PlayersStatsAndInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: (){
                          Navigator.of(context).pop(false);
                          navigateMyApp(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)
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
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Card(
                        elevation: 10,
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
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Card(
                                    color: Colors.teal,
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
                                    children: const <Widget>[
                                      Text('position'),
                                      Text('data 1a'),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 10
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text('preferred foot'),
                                      Text('data 2a'),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 30
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
                        )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 60, left: 6, bottom: 15),
                      child: Text('Most Fouled Players'),
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
                                          // mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Text('Yellow Cards'),
                                            Text('data2'),
                                            SizedBox(
                                                height: 40
                                            ),
                                            Text('Name Surname'),
                                            // Text('data2'),

                                          ],
                                        ),
                                      )
                                  ),
                                ),
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
                      ],
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom:20, left: 5),
                      child: Text(
                        'Most Assists Player',
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: Card(
                        elevation: 10,
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
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Card(
                                    color: Colors.teal,
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
                                    children: const <Widget>[
                                      Text('position'),
                                      Text('data 1a'),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 10
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const <Widget>[
                                      Text('preferred foot'),
                                      Text('data 2a'),
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 30
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
                        )
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
}
