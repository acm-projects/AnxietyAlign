import 'package:anxiety_align/screens/graphs/gdata.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart1 extends StatelessWidget {
  final List<GraphData> data;
  final String text;

  PieChart1({required this.data, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 500,
        child: SfCircularChart(
          title: ChartTitle(
              text: text,
              alignment: ChartAlignment.center,
              textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                  fontFamily: 'WingDing',
                  fontWeight: FontWeight.bold)),
          legend: Legend(
            //height: '80%',
            height: '200%',
              //width: '70%',
              isVisible: false,
              position: LegendPosition.auto,
              overflowMode: LegendItemOverflowMode.wrap,
              iconHeight: 20,
              iconWidth: 20),
          series: <CircularSeries>[
            PieSeries<GraphData, String>(
              dataSource: data,
              xValueMapper: (GraphData data, _) => data.section,
              yValueMapper: (GraphData data, _) => data.count,
              pointColorMapper: (GraphData data, _) => data.color,
              dataLabelMapper: (GraphData data, _) => data.section,
                dataLabelSettings: DataLabelSettings(
                    showZeroValue : false,
                    isVisible: true,
                    // Avoid labels intersection
                    labelIntersectAction: LabelIntersectAction.shift,
                    labelPosition: ChartDataLabelPosition.outside,
                    connectorLineSettings: ConnectorLineSettings(
                        type: ConnectorType.curve, length: '25%')
                )
            )
          ],
        ));
  }
}
