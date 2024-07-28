// create a widget for common buttons  
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/utils/colors.dart';

Container myButton(BuildContext context, String buttonName, Function(BuildContext context) myFunction){
  Size size = MediaQuery.of(context).size;
  return Container(
    child: GestureDetector(
      onTap: () {
        myFunction(context);
      },
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
      ),
    ),
  );
}