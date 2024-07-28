import 'package:flutter/material.dart';

class Student extends StatelessWidget {
  const Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hi Student!",
              style: TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 31, 9, 228)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Let's make your academic path on track!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 4, 29, 130)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "There are few steps to start...!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 3, 31, 63)),
            ),
            SizedBox(
              height: 250,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Let's Go",
                style: TextStyle(fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                // Adjust button size
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 31, 9, 228),
                minimumSize: Size(200, 65), // Set button text color
                // You can also adjust other properties like padding, shape, etc.
              ),
            )
          ],
        ),
      ),
    );
  }
}
