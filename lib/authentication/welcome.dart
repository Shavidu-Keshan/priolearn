import 'package:flutter/material.dart';
import 'package:group_13_priolearn/authentication/login.dart';
import 'package:group_13_priolearn/authentication/sign_up.dart';
import 'package:group_13_priolearn/utils/colors.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.center,
                "Welcome to \nPrioLearn",
                style: TextStyle(color: Colors.black, fontSize:40 
                ),
              ),
              const SizedBox(height: 250,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> SignUp()));
                  },
                  child: Container(
                    width: size.width*0.6,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 40,),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> Login()));
                  },
                  child: Container(
                    width: size.width*0.6,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}