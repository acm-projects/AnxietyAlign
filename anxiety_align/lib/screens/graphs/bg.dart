import 'package:anxiety_align/screens/graphs/gdata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraph extends StatelessWidget {
  final List<GraphData> data;

  BarGraph({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Container(
        color: Color(0xFF96B4A0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text("attacks by month:",
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                      letterSpacing: 2.0,
                      fontFamily: 'WingDing',
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  plotAreaBorderColor: Color(0xFF000000),
                  primaryXAxis: CategoryAxis(
                      //Hide the gridlines of x-axis
                      majorGridLines:
                          MajorGridLines(width: 0, color: Color(0xFF000000)),
                      //Hide the axis line of x-axis
                      axisLine: AxisLine(width: 1, color: Color(0xFF000000)),
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold)),
                  primaryYAxis: NumericAxis(
                      isVisible: false,
                      //Hide the gridlines of y-axis
                      majorGridLines:
                          MajorGridLines(width: 0, color: Color(0xFF000000)),
                      //Hide the axis line of y-axis
                      axisLine: AxisLine(width: 1, color: Color(0xFF000000)),
                      labelStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold)),
                  series: <CartesianSeries>[
                    // Renders bar chart
                    ColumnSeries<GraphData, String>(
                      dataSource: data,
                      xValueMapper: (GraphData data, _) => data.section,
                      yValueMapper: (GraphData data, _) => data.count,
                      pointColorMapper: (GraphData data, _) => data.color,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
