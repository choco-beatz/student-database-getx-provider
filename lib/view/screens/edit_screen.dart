import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_database/constants/colors.dart';
import 'package:student_database/constants/space.dart';
import 'package:student_database/controller/controller.dart';
import 'package:student_database/model/student_model.dart';
import 'package:student_database/view/widget/text_field.dart';

class Edit extends StatelessWidget {
  final Student student;
  Edit({super.key, required this.student});
  final controller = Get.put(Controller());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = student.name;
    departmentController.text = student.department;
    ageController.text = student.age.toString();
    emailController.text = student.email;
    final imgPicker = ImagePicker();

    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: white,
        title: const Text(
          'EDIT',
        ),
        backgroundColor: black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(onTap: () async {
                final pickedImage = await imgPicker.pickImage(
                  source: ImageSource.gallery,
                );
                if (pickedImage != null) {
                  controller.imagePick(pickedImage.path);
                }
              }, child: Obx(
                () {
                  return controller.imagePath.isNotEmpty
                      ? CircleAvatar(
                          backgroundImage: FileImage(File(controller.imagePath.value)),
                          radius: 80,
                        )
                      : CircleAvatar(
                          backgroundImage: FileImage(File(student.imgurl!)),
                          radius: 80,
                        );
                },
              )),
              space,
              CustomTextField(
                  controller: nameController,
                  type: TextInputType.name,
                  label: 'Name',
                  validate: 'Name is required!'),
              space,
              CustomTextField(
                  controller: ageController,
                  type: TextInputType.number,
                  label: 'Age',
                  validate: 'Age is required!'),
              space,
              CustomTextField(
                  controller: departmentController,
                  type: TextInputType.name,
                  label: 'Department',
                  validate: 'Department is required!'),
              space,
              CustomTextField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: 'Email',
                  validate: 'Email is required!'),
              space,
              ElevatedButton(
                onPressed: () async {
                 
                    
                    await controller.updateStudent(Student(
                      id: student.id,
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        department: departmentController.text,
                        email: emailController.text,
                        imgurl: controller.imagePath.value.isNotEmpty
                        ?controller.imagePath.value
                        :student.imgurl));
                    Get.back();

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Updated successfully'),
                      backgroundColor: black,
                    ));
               
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
