import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/authentication/login.dart';
import 'package:group_13_priolearn/utils/button_dynamic.dart';
import 'package:group_13_priolearn/utils/colors.dart';
import 'package:group_13_priolearn/utils/text_field.dart';

class SignUp extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  Future<void> _signUp(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // successfull sign up, navigate to login page
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => Login(),)
      );
    } 
    on FirebaseAuthException catch(e){
      String message;
      if (e.code == 'email-already-in-use') {
        message = "The email you entered is already in use by an existing user";
      }else if(e.code == 'invalid-email'){
        message = "The email address is not valid";
      }else if(e.code == 'weak-password'){
        message = "The password is too weak";
      }else{
        message = "Failed to sign up. Please try again.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
      );
    }
    catch (e) {
      // Handle sign up errors
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to sign up."))
        ); 
    }
  }

  SignUp({super.key});

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
              const Text("Sign Up", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,), ),
              SizedBox(height: size.height * 0.04),
              const SizedBox(height: 15,),
              myTextField("username", _usernameController, false),
              const SizedBox(height: 15,),
              myTextField("Email", _emailController, false),
              const SizedBox(height: 15,),
              myTextField("Password", _passwordController, true),
              SizedBox(height: size.height * 0.04,),
        
              myButton(context, "Sign Up", _signUp),
              SizedBox(height: size.height*0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Text("Log In", style: TextStyle(color: Colors.blue.shade400),),
                  )],
              )
            ],
          ),
        ),
      ),
    );
  }
}