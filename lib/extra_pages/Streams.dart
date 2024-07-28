import 'package:flutter/material.dart';

class Streams extends StatelessWidget {
  const Streams({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "According to the  ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            Text(
              "information ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            Text(
              "you have given you are ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            Text(
              "scheduled to face ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            Text(
              "Advanced Level Examination  ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            Text(
              "in Maths Stream...! ",
              style: TextStyle(
                  fontSize: 25, color: Color.fromARGB(255, 15, 4, 240)),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
