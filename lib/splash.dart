import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/authentication/welcome.dart';
import 'package:group_13_priolearn/pages/new_home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 10));

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null ) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>Welcome()) 
      );
    } else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context)=>NewHome()) 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: -screenHeight * 0.3,
                left: screenWidth * 0.05,
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF475FE0).withOpacity(0.5),
                      shape: BoxShape.circle),
                )),
            Positioned(
                top: -screenHeight * 0.08,
                left: -screenWidth * 0.15,
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
                    Text("PrioLearn",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[600],
                        )),
                    SizedBox(
                      height: screenHeight * 0.06,
                    ),
                    Positioned(
                      child: Image.asset("assets/image-9.png",
                          height: 250, width: 250),
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    const Text(
                      "Unlock your academic potential and embrace balance with PrioLearn.",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.55,
              left: screenWidth * 0.75,
              child: Container(
                width: 400.0,
                height: 400.0,
                decoration: BoxDecoration(
                    color: const Color(0xFF50C0FF).withOpacity(0.5),
                    shape: BoxShape.circle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
