import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class StressReliefPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stress Relief',
          style: TextStyle(
            color: Color(0xFF4169E1), // Royal Blue
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Take a deep breath and relax.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4169E1),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Here are a few activities you can try:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4169E1),
                ),
              ),
            ),
            SizedBox(height: 20),
            activityTile(context, Icons.spa, 'Meditation'),
            activityTile(context, Icons.directions_run, 'Exercise'),
            activityTile(context, Icons.music_note, 'Listen to soothing music'),
            activityTile(context, Icons.book, 'Read a book'),
            activityTile(context, Icons.nature, 'Go for a nature walk'),
            activityTile(
                context, Icons.brush, 'Engage in art or craft activities'),
          ],
        ),
      ),
    );
  }

  Widget activityTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF4169E1)),
      title: Text(title, style: TextStyle(color: Colors.black)),
      trailing: IconButton(
        icon: Icon(Icons.play_arrow, color: Color(0xFF4169E1)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActivityPage(title: title),
            ),
          );
        },
      ),
    );
  }
}

class ActivityPage extends StatefulWidget {
  final String title;

  ActivityPage({required this.title});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  Timer? timer;
  int remainingTime = 600; // 10 minutes in seconds
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    startTimer();
    playAudio();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        onEnd();
      }
    });
  }

  Future<void> playAudio() async {
    if (widget.title == 'Meditation') {
      await audioPlayer.setSourceAsset('theme_02.mp3');
    } else {
      await audioPlayer.setSourceAsset('theme_01.mp3');
    }
    audioPlayer.resume();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    timer?.cancel();
    super.dispose();
  }

  void onEnd() {
    audioPlayer.stop();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Time\'s up!')));
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enjoy your activity!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4169E1)),
            ),
            SizedBox(height: 20),
            if (widget.title == 'Meditation')
              Image.asset('assets/med.jpg', width: 300, height: 300),
            SizedBox(height: 20),
            Text(
              '$minutes:${seconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 48, color: Color(0xFF4169E1)),
            ),
          ],
        ),
      ),
    );
  }
}
