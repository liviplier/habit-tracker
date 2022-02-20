// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:habit_application/Widgets/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:syncfudion_flutter_charts/charts.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(148, 180, 255, 1),
            ),
            child: const LiveChart(),
          ),
          Wrap(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(148, 180, 255, 1),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/icons/confetti.png"),
                    const Text(
                      '-', // from database
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor1,
                      ),
                    ),
                    const Text(
                      'Current Streak',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: AppColors.textColor1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(148, 180, 255, 1),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/icons/flame.png"),
                    const Text(
                      '-', // from database
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Longest Streak',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(148, 180, 255, 1),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/icons/crown.png"),
                    const Text(
                      'HABITS', //from database
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Habits Completed',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(148, 180, 255, 1),
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Image.asset("assets/icons/chat-arrow-grow.png"),
                    const Text(
                      '', // from database
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Completion Rate',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4, // change to non static value
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: GestureDetector(
                                child: const Text(
                                  "Habit Name", // from database
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColors.textColor2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LiveChart extends StatefulWidget {
  const LiveChart({Key? key}) : super(key: key);

  @override
  _LiveChartState createState() => _LiveChartState();
}

class _LiveChartState extends State<LiveChart> {
  final dbRef = Firebase.instance.reference();

  List<_ChartData> chartData = <_ChartData>[];
  Timer timer;
  ChartSeriesController _chartSeriesController;
  int count = 19;

  void _updateDataSource(Timer timer) {}
  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(Duration(milliseconds: 5000), _updateDataSource);
    return Container(
      width: double.maxFinite,
      height: 400,
      child: StreamBuilder<void>(
        stream: dbRef.child("Data").onValue,
        builder: (context, snapshot) {
          Widget widget;
          if (snapshot.hasData) {
            List<_ChartData> chartData = <_ChartData>[];
            for (int index = 0;
                index < snapshot.data.snapshot.length;
                index++) {
              DataSnapshot snaps = snapshot.data.snapshot[index];
              chartData.add(_ChartData.fromMap(snaps.data));
            }
            widget = Container(
              child: SfCartesianChart(
                tooltipBehavior: TooltipBehavior(enable: true).
                primaryAxis: DateTimeAxis(),
                series: <LineSeries<_ChartData, int onRendererCreated: (ChartSeriesController controller)  {
                  _chartSeriesController controller;
                },
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.xValue,
                yValueMapper: (_ChartData data, _) => data.yValue,
              ),
              ]),
            );
          }
        },
        return widget;
  }));
  }

}

class _ChartData {
  _ChartData({
    this.xValue, this.yValue
  });
  _ChartData.fromMap(Map<String, int)
}
