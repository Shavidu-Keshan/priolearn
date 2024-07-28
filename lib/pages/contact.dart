import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Feel free to reach out to us.",
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 31, 9, 228),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "General Inquiries:",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 2, 1, 16),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("Gmail: info@priolearn.com"),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("Telephone: +94 123 4567"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Technical Support:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 2, 1, 16),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("Gmail: info@priolearn.com"),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.call,
                  color: Colors.black,
                ),
                SizedBox(width: 20),
                Text("Telephone: +94 123 4567"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Feedback and Suggestions:",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 2, 1, 16),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Share Your Thoughts with Us..."),
            Text("feedback@priolearn.com"),
            Text("Address: Priolearn Headquarters"),
          ],
        ),
      ),
    );
  }
}
