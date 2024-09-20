import 'package:flutter/material.dart';
import 'package:student_database/constants/colors.dart';

class Profile extends StatelessWidget {
  
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
          title: const Text(
            'PROFILE',
            style: TextStyle(color: white),
          ),
          backgroundColor: black,
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              CircleAvatar(
                radius: 80,
                // backgroundImage: student.imgurl != null
                // ? FileImage(File(student.imgurl!))
                // : null,
                // child: student.imgurl == null ? const Icon(Icons.camera_alt_outlined) : null,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "student.name",
              style: const TextStyle(fontSize: 20),),
             const SizedBox(
                height: 25,
              ),
              Text("student.department",
              style: const TextStyle(fontSize: 15),),
              const SizedBox(
                height: 25,
              ),
              Text('student.email',
              style: const TextStyle(fontSize: 20),)
            ],),),
      ),
    );
  }
}
