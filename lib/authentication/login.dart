import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_13_priolearn/authentication/forget_pw.dart';
import 'package:group_13_priolearn/authentication/sign_up.dart';
import 'package:group_13_priolearn/get_basic_information/save_al_page.dart';
import 'package:group_13_priolearn/pages/new_home.dart';
import 'package:group_13_priolearn/utils/button_dynamic.dart';
import 'package:group_13_priolearn/utils/text_field.dart';
import 'package:group_13_priolearn/utils/colors.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _logIn(BuildContext context) async {
    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Check if user exists and email and password are correct
      if (userCredential.user != null) {
        // Navigate to the home screen upon successful sign in
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => NewHome())
          );
      } else {
        // Handle sign in errors
        showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return const AlertDialog(
              title: Text("User not found"),
              content: Text("User account not found or email/password incorrect."),
            );
          });
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific sign in errors
      if (e.code == 'user-not-found') {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return const AlertDialog(
              content: Text("No user found with that email."),
            );
          }
      );
      } else if (e.code == 'wrong-password') {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return const AlertDialog(
              content: Text("Wrong password provided for that user."),
            );
          }
      );
      }else if (e.code == 'invalid-email') {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return const AlertDialog(
              content: Text("Wrong password provided for that user."),
            );
          }
      );
      } 
      else {
        // Handle other FirebaseAuthException errors
        showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              content: Text("Sign in failed: ${e.message}"),
            );
          }
      );
      }
    } catch (e) {
      // Handle generic errors
      showDialog(
          // ignore: use_build_context_synchronously
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              content: Text("Failed to sign in: $e"),
            );
          }
      );
    }
  }

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              const Text("Log In", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: size.height * 0.04),
              const SizedBox(height: 15,),
              myTextField("Email", _emailController, false),
              const SizedBox(height: 15,),
              myTextField("Password", _passwordController, true),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>const ForgetPassword()));
                  },
                  child: Text("Forget Password", style: TextStyle(color: Colors.blue.shade400),),
                  )],
              ),
              const SizedBox(height: 15,),
              myButton(context, "Login", _logIn),
              SizedBox(height: size.height*0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Not a member? "),
                  GestureDetector(onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.blue.shade400),),
                  )],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}
