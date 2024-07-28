import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/progress/main_bar_graph.dart';
import 'package:intl/intl.dart';

class ShowProgress extends StatefulWidget {
  const ShowProgress({super.key});

  @override
  State<ShowProgress> createState() => _ShowProgressState();
}

class _ShowProgressState extends State<ShowProgress> {
  List<double> weeklySummary = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];

  @override
  void initState() {
    super.initState();
    _fetchWeeklyData();
  }

  //create a method for fetch weekly data--------
  Future<void> _fetchWeeklyData() async {
    final DateTime now = DateTime.now();
    DateTime startOfWeek;
    DateTime endOfWeek;

    // If today is Sunday (start of a new week), get the previous week's data
    if (now.weekday == DateTime.sunday) {
      endOfWeek = now.subtract(Duration(days: 1));
      startOfWeek = endOfWeek.subtract(Duration(days: 6));
    } else {
      endOfWeek = now.subtract(Duration(days: now.weekday));
      startOfWeek = endOfWeek.subtract(Duration(days: 6));
    }

    // get the relevant dataset
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('tasks')
        .where('type', isEqualTo: 'Academic')
        .where('date', isGreaterThanOrEqualTo: startOfWeek)
        .where('date', isLessThanOrEqualTo: endOfWeek)
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
      weeklySummary = [
        tempWeeklyData['Sunday']!.toDouble(),
        tempWeeklyData['Monday']!.toDouble(),
        tempWeeklyData['Tuesday']!.toDouble(),
        tempWeeklyData['Wednesday']!.toDouble(),
        tempWeeklyData['Thursday']!.toDouble(),
        tempWeeklyData['Friday']!.toDouble(),
        tempWeeklyData['Saturday']!.toDouble(),
      ];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Progress"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          SizedBox(
            height: 400,
            child: MainBarGraph(
              weeklySummary: weeklySummary,
            ),
          ),
        ],
      ),
    );
    // replace by my bar graph
  }
}
