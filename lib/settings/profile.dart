import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:group_13_priolearn/utils/button_dynamic.dart';
import 'package:group_13_priolearn/utils/button_void.dart';
import 'package:group_13_priolearn/utils/text_field.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController  _ALYearController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController  _ALStartController = TextEditingController();
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Settings"),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child:
                      _image == null ? Icon(Icons.add_a_photo, size: 50) : null,
                ),
              ),
              const SizedBox(height: 20,),
              myTextField("First Name", _firstNameController, false),
              const SizedBox(height: 20,),
              myTextField("Last Name", _lastNameController, false),
              const SizedBox(height: 20,),
              myTextField("Email", _emailController, false),
              const SizedBox(height: 20,),
              TextField(
                  controller: _ALYearController,
                  decoration: const InputDecoration(
                    labelText: "AL year",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    )
                  ),
                  onTap: () async{
                    DateTime? pickedDate = await showDatePicker(
                      context: context, 
                      firstDate: DateTime(2024), 
                      lastDate:DateTime(2030),
                      initialDate: DateTime.now(), 
                    );
                    if (pickedDate!=null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        _ALYearController.text = formattedDate;
                      });
                    }
                  },
              ),
              const SizedBox(height: 20,),
              TextField(
                    controller: _ALStartController,
                    decoration: const InputDecoration(
                      labelText: "AL start date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                    ),
                    onTap: () async{
                      DateTime? pickedDate = await showDatePicker(
                        context: context, 
                        firstDate: DateTime(2024), 
                        lastDate:DateTime(2030),
                        initialDate: DateTime.now(), 
                      );
                      if (pickedDate!=null) {
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          _ALStartController.text = formattedDate;
                        });
                      }
                    },
                ),
                const SizedBox(height: 20,),
                myButtonVoid(context, "Save", _saveProfile)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _pickImage() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile!=null) {
      setState(() {
        _image = File(pickedFile.path);
      });     
    }
  }

  Future<void> _saveProfile() async{
    try {
      String? imageUrl;

      // check if there is an image to upload
      if (_image != null) {
        FirebaseStorage _storage = FirebaseStorage.instanceFor(
          bucket: 'gs://priolearn.appspot.com'
        );
        // Get the file extension
        String extension = path.extension(_image!.path);
        final storageRef = _storage.ref().child('profile_pictures/${DateTime.now().millisecondsSinceEpoch}$extension');
        final uploadTask = storageRef.putFile(_image!);
        final snapshot = await uploadTask;
        imageUrl = await snapshot.ref.getDownloadURL();
      }

      // save the profile details to firestore
      await FirebaseFirestore.instance.collection('user_details').doc().set({
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'alYear': _ALYearController.text,
        'alStar':_ALStartController.text,
        'profilePicture':imageUrl
      });
    } catch (e) {
      print('error...$e');
    }
    
  }
}