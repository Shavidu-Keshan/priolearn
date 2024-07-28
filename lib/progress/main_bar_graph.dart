import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/progress/bar_data.dart';

class MainBarGraph extends StatefulWidget {
  final List<double> weeklySummary;
  const MainBarGraph({Key? key, required this.weeklySummary}) : super(key: key);

  @override
  State<MainBarGraph> createState() => _MainBarGraphState();
}

class _MainBarGraphState extends State<MainBarGraph> {
  @override
  Widget build(BuildContext context) {
    // Convert durations from minutes to hours
    List<double> weeklySummaryInHours = widget.weeklySummary.map((duration) => duration / 60).toList();

    // Determine maxY based on the max duration of the week
    //double maxY = weeklySummaryInHours.reduce((a, b) => a > b ? a : b);

    double yMax = widget.weeklySummary[0]; // Assume the first element is the largest initially

  for (int i = 0; i <widget.weeklySummary.length; i++) {
    if (widget.weeklySummary[i] > yMax) {
      yMax = widget.weeklySummary[i];
    }
  }
    BarTouchData();

    BarData myBarData = BarData(sunAmount: widget.weeklySummary[0], monAmount: widget.weeklySummary[1], tueAmount: widget.weeklySummary[2], wedAmount: widget.weeklySummary[3], thuAmount: widget.weeklySummary[4], friAmount: widget.weeklySummary[5], satAmount: widget.weeklySummary[6]);
    myBarData.initializedBarData();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BarChart(
            BarChartData(
              maxY: yMax+10,
              minY: 0,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false), 
              titlesData: const FlTitlesData(
                show: true,
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getBottomTitles))
              ),
              barGroups: myBarData.barData.map((data)=>BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y)
                ]
              )).toList()
            )
          ),
        ),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.black,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style,);
      break;
    case 1:
      text = const Text('M', style: style,);
      break;
    case 2:
      text = const Text('T', style: style,);
      break;
    case 3:
      text = const Text('W', style: style,);
      break;
    case 4:
      text = const Text('T', style: style,);
      break;
    case 5:
      text = const Text('F', style: style,);
      break;
    case 6:
      text = const Text('S', style: style,);
      break;
    default:
      text = const Text('S', style: style,);
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
  
}