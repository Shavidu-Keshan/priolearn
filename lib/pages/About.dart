import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ABOUT"),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "PrioLearn",
                style: TextStyle(
                    fontSize: 50, color: Color.fromARGB(255, 31, 9, 228)),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                " Stressed Sri Lankan AL Students? ",
                style: TextStyle(
                    fontFamily: AutofillHints.postalAddressExtended,
                    fontSize: 25,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "WE GOT YOU!",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "*Struggling to manage deadline and your workload?",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                "*Feeling overwhelmed by the preasure of Advanced Levels?",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Introducing PrioLearn,your one-stop app for Sri Lankan AL success!",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 31, 9, 228)),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "*We help you track assignments,exams and stay on top of your schedule.",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              Text(
                "*Get personalized study suggesions and stress busting tips tailored for YOU",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 16, 0, 0)),
              ),
            ],
          ),
        ));
  }
}
