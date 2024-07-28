import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class ProgressHome extends StatefulWidget {
  const ProgressHome({super.key});

  @override
  State<ProgressHome> createState() => ProgressHomeState();
}

class ProgressHomeState extends State<ProgressHome> {
  Map<String, int> _weeklyData = {
    'Sunday': 0,
    'Monday': 0,
    'Tuesday': 0,
    'Wednesday': 0,
    'Thursday': 0,
    'Friday': 0,
    'Saturday': 0,
    
  };
  @override
  void initState() {
    super.initState();
    _fetchWeeklyData();
  }

  //create a method for fetch weekly data--------
  Future<void> _fetchWeeklyData() async {
    final DateTime now = DateTime.now(); // end date of the week
    final DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // start date of the week

    try {
      // get the relevant dataset
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('tasks')
          .where('type', isEqualTo: 'Academic')
          .where('date', isGreaterThanOrEqualTo: startOfWeek)
          .where('date', isLessThanOrEqualTo: now)
          .get();

      final List<QueryDocumentSnapshot> documents = snapshot.docs;


      Map<String, int> tempWeeklyData = {
        'Sunday': 0,
        'Monday': 0,
        'Tuesday': 0,
        'Wednesday': 0,
        'Thursday': 0,
        'Friday': 0,
        'Saturday': 0,
      };

      for (var doc in documents) {
        dynamic dateData = doc['date'];
        DateTime date;

        if (dateData is Timestamp) {
          date = dateData.toDate();
        } else if (dateData is String) {
          date = DateTime.parse(dateData);
        } else {
          continue;
        }

        String dayOfWeek = DateFormat('EEEE').format(date);
        int duration = (doc['duration'] as num).toInt();
        tempWeeklyData[dayOfWeek] = (tempWeeklyData[dayOfWeek] ?? 0) + duration;
      }

      setState(() {
        _weeklyData = tempWeeklyData;
      });
    } catch (e) {
      print("Error fetching weekly data: $e"); // Error handling
    }
  }

  //---------------------------------------------
  Widget build(BuildContext context) {
    final Map<String, int> _dayToIndex = {
      'Sunday': 0,
      'Monday': 1,
      'Tuesday': 2,
      'Wednesday': 3,
      'Thursday': 4,
      'Friday': 5,
      'Saturday': 6,
      
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress"),
      ),
      body: Column(
        children: [
          BarChart(BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: _weeklyData.entries.map((entry) {
                final double value = entry.value.toDouble();
                return BarChartGroupData(x: _dayToIndex[entry.key]!, barRods: [
                  BarChartRodData(
                      toY: value.isFinite ? value : 0.0,
                      color: Color.fromARGB(0, 76, 76, 216))
                ]);
              }).toList(),
              titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14);
                            Widget text = Text('');
                            switch (value.toInt()) {
                              case 0:
                                text = const Text('S', style: style);
                                break;
                              case 1:
                                text = const Text('M', style: style);
                                break;
                              case 2:
                                text = const Text('T', style: style);
                                break;
                              case 3:
                                text = const Text('W', style: style);
                                break;
                              case 4:
                                text = const Text('T', style: style);
                                break;
                              case 5:
                                text = const Text('F', style: style);
                                break;
                              case 6:
                                text = const Text('S', style: style);
                                break;
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 16,
                              child: text, 
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value,TitleMeta meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              ),
                            );
                          },
                        )
                      )
                    )
                  )
                )
        ],
      ),
    );
  }
}
