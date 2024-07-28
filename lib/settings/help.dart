import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help"),),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("At PrioLearn, we are committed to providing the best support to ensure a seamless experience for our users. If you encounter any technical issues, have questions, or need assistance with the app, our support team is here to help."),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Phone Support", )
            ),
            SizedBox(height: 5,),
            Row(children: [
              Icon(Icons.phone),
              SizedBox(width: 20,),
              Text("Call Us: 0770000000"),
            ],),
            SizedBox(height: 20,),
            Text("Our support team is available during business hours to address your concerns."),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email Support", )
            ),
            SizedBox(height: 5,),
            Row(children: [
              Icon(Icons.email),
              SizedBox(width: 20,),
              Text("Email Us: priolearn@example.com"),
            ],),
            SizedBox(height: 20,),
            Text("We strive to respond to all inquiries within 24 hours. Please include detailed information about your issue to help us assist you more effectively.Feel free to contact us with any feedback or suggestions you may have to improve your experience with PrioLearn. Your satisfaction is our priority.")
          ],
        ),
      ),
    );
  }
}