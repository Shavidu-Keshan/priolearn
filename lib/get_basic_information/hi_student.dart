import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const HiStudent());
}

class HiStudent extends StatelessWidget {
  const HiStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PrioLearn",
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -screenHeight * 0.08,
                right: -screenWidth * 0.15,
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF5EE689).withOpacity(0.5),
                      shape: BoxShape.circle),
                )),
            Center(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.15),
                child: Column(
                  children: [
                    const Text("Hi Student",
                        style: TextStyle(
                          fontSize: 40,
                          
                          //fontWeight: FontWeight.bold,
                          //color: Colors.blue[600],
                        ),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    const Text(
                      "Let’s make your academic path on track! ",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    const Text(
                      "There are few steps to Start!",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Positioned(
              bottom: screenHeight * 0.3,
              left: screenWidth * 0.2,
              child: Image.asset("assets/image-2.jpeg", height: 250, width: 250),
            ),
            Positioned(
              bottom: screenHeight * 0.1,
              left: screenWidth * 0.85,
              child: Container(
                width: 400.0,
                height: 400.0,
                decoration: BoxDecoration(
                    color: const Color(0xFF50C0FF).withOpacity(0.5),
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              top: screenHeight * 0.8,
              right: screenWidth * 0.7,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF50C0FF).withOpacity(0.5),
                    shape: BoxShape.circle),
              ),
            ),
            Positioned(
              top: screenHeight * 0.72,
              right: screenWidth * 0.18,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(259, 67),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Let’s Go",
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
