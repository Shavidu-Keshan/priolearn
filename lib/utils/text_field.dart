
// create a widget for common text fields    
import 'package:flutter/material.dart';

Container myTextField(String label, TextEditingController myController, bool isObsecure ){
    return Container(
      child: TextField(
                controller: myController,
                obscureText: isObsecure,
                decoration: InputDecoration(
                  labelText: label,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 0, 140, 255))
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.red)
                  ),
                ),
              ),
    );
  }

