import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/utils/colors.dart';
import 'package:group_13_priolearn/utils/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  
  Future resetPassword() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password"),),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            const Text("Enter your email.  \nWe will send you a password reset link.", style: TextStyle(fontSize: 32),),
            const SizedBox(height: 15,),
            myTextField("Email", _emailController, false),
            const SizedBox(height: 15,),
            //ElevatedButton(onPressed: resetPassword, child: const Text("Reset Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)),
            GestureDetector(
              onTap: (){resetPassword();},
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: const Center(
                  child: Text(
                    "Reset Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                    ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}