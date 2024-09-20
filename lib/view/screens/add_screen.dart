import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/constants/colors.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    
    String? imagepath;
    final imgPicker = ImagePicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'REGISTERATION',
          style: TextStyle(color: white),
        ),
        backgroundColor: black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () async {
                    final pickedImage = await imgPicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedImage != null) {
                      imagepath = pickedImage.path;
                    }
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(File(imagepath!)),
                    radius: 60,
                  )),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
              
                decoration: const InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: black, width: 2)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
               
                decoration: const InputDecoration(
                  labelText: 'Age',
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: black)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                
                decoration: const InputDecoration(
                  labelText: 'department',
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: black)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Department is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
               
                decoration: const InputDecoration(
                  labelText: 'Email',
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: black)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required!';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (imagepath == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Select an image"),
                        backgroundColor: black,
                      ));
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Added successfully'),
                      backgroundColor: black,
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: black,
                ),
                child: const Text(
                  'SAVE',
                  style: TextStyle(color: white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
