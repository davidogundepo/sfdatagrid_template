import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../main.dart';

class SeasonTimeline extends StatefulWidget {
  const SeasonTimeline({Key? key}) : super(key: key);

  @override
  State<SeasonTimeline> createState() => _SeasonTimelineState();
}

class _SeasonTimelineState extends State<SeasonTimeline> {

  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    final List<PlayersPopulationChartData> playersPopulationChartData = [
      PlayersPopulationChartData('Attackers', 16),
      PlayersPopulationChartData('Midfielders', 35),
      PlayersPopulationChartData('Defenders', 19),
      PlayersPopulationChartData('GoalKeepers', 7)
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tables and Stats',
            // style: TextStyle(
            //     color: appBarIconColor
            // )
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appBarIconColor),
          onPressed: () {
            Navigator.of(context).pop(false);
            navigateMyApp(context);
          },
        ),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/timeline_back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
          child: SingleChildScrollView(
            child: SafeArea(
              top: true,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlurryContainer(
                      color: Colors.indigo.withOpacity(0.45),
                      blur: 1,
                      elevation: 16,
                      height: 300,
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                              child: Text(
                                  'Last 7 Matches | Win-Draw-Loss Chart',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )),

                          SfSparkWinLossChart(
                            color: Colors.blue.withOpacity(0.85),
                            negativePointColor: Colors.red.withOpacity(0.75),
                            tiePointColor: Colors.black54,
                            trackball: const SparkChartTrackball(
                              color: Colors.blueGrey,
                              backgroundColor: Colors.blueGrey,
                              activationMode: SparkChartActivationMode.tap
                            ),
                            data: const <double>[
                              2.1, 3.1, -2.4, 5.3, 0.0, 4.2, -1.3
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlurryContainer(
                      color: Colors.blue.withOpacity(0.45),
                      blur: 1,
                      elevation: 16,
                      height: 450,
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                              child: Text(
                                  'Monthly Training Attendance Chart',
                              style: TextStyle(
                                color: Colors.white
                              ),)),

                          SfCartesianChart()
                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlurryContainer(
                      color: Colors.white.withOpacity(0.15),
                      blur: 1,
                      elevation: 16,
                      height: 300,
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Club's Monthly Efficiency | Evaluation Gauge")),

                          SfSparkWinLossChart(
                            color: Colors.teal.withOpacity(0.55),
                            negativePointColor: Colors.red.withOpacity(0.55),
                            tiePointColor: Colors.blueGrey,
                            trackball: const SparkChartTrackball(
                                color: Colors.blueGrey,
                                backgroundColor: Colors.blueGrey,
                                activationMode: SparkChartActivationMode.tap
                            ),
                            data: const <double>[
                              12, 15, -10, 13, 0, 8, -13
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlurryContainer(
                      color: Colors.white.withOpacity(0.15),
                      blur: 1,
                      elevation: 16,
                      height: 300,
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                              child: Text('12 days left | Special Event/Match Counter')),

                          SfSparkWinLossChart(
                            color: Colors.teal.withOpacity(0.55),
                            negativePointColor: Colors.red.withOpacity(0.55),
                            tiePointColor: Colors.blueGrey,
                            trackball: const SparkChartTrackball(
                              color: Colors.blueGrey,
                              backgroundColor: Colors.blueGrey,
                              activationMode: SparkChartActivationMode.tap
                            ),
                            data: const <double>[
                              12, 15, -10, 13, 0, 8, -13
                            ],
                          ),
                        ],
                      ),

                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlurryContainer(
                      color: Colors.teal.withOpacity(0.45),
                      blur: 1,
                      elevation: 16,
                      height: 400,
                      padding: const EdgeInsets.all(32),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Total Players Population Chart',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )),
                            SfCircularChart(
                              tooltipBehavior: _tooltipBehavior,
                              legend: Legend(
                                alignment: ChartAlignment.center,
                                overflowMode: LegendItemOverflowMode.wrap,
                                isResponsive: true,
                                isVisible: true,
                                position: LegendPosition.bottom,
                                textStyle: const TextStyle(
                                  color: Colors.white
                                )
                              ),
                              palette: [
                                Colors.teal, Colors.indigo.shade600, Colors.blueAccent, Colors.redAccent
                              ],
                              series: <CircularSeries>[
                                PieSeries<PlayersPopulationChartData, String>(
                                  enableTooltip: true,
                                  dataSource: playersPopulationChartData,
                                  xValueMapper: (PlayersPopulationChartData data, _) => data.x,
                                  yValueMapper: (PlayersPopulationChartData data, _) => data.y,
                                  dataLabelSettings: const DataLabelSettings(
                                    useSeriesColor: true,
                                    isVisible: true,
                                    labelPosition: ChartDataLabelPosition.outside,
                                    labelIntersectAction: LabelIntersectAction.shift,
                                    connectorLineSettings: ConnectorLineSettings(
                                      type: ConnectorType.curve
                                    )
                                  ),
                                  explode: true,
                                  animationDuration: 4500,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                ],
              ),
            ),
          ),
      ),
    );

  }


  Future navigateMyApp(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  @override
  void initState() {
    _tooltipBehavior =  TooltipBehavior(enable: true);
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

}

class PlayersPopulationChartData {
  PlayersPopulationChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color? color;
}
