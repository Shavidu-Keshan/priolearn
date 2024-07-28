import 'package:flutter/material.dart';
// not finalized
class Agreement extends StatelessWidget {
  const Agreement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PrioLearn",
      home: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40, right: 40),
              child: Text(
                "Are you agree to our terms & conditions?",
                style: TextStyle(fontSize: 40, fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40),
              child: Text(
                "Click here to read our terms & conditions.",
                style: TextStyle(fontSize: 25, fontFamily: 'Inter'),
              ),
            ),
            const SizedBox(height: 90),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(259, 67),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Agree",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(259, 67),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Ignore",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
