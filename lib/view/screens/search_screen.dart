import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_database/constants/colors.dart';
import 'package:student_database/controller/controller.dart';
import 'package:student_database/view/screens/profile_screen.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    controller.resetController();
    return Scaffold(
        appBar: AppBar(
          foregroundColor: white,
          title: const Text(
            'SEARCH',
          ),
          backgroundColor: black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Theme(
                data: ThemeData(
                    cupertinoOverrideTheme:
                        const CupertinoThemeData(primaryColor: black)),
                child: CupertinoSearchTextField(
                  onChanged: (value) => controller.search(value),
                  padding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: black,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.studentFound.value.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        onTap: () {
                          Get.to(Profile(
                              image:
                                  controller.studentFound.value[index].imgurl!,
                              name: controller.studentFound.value[index].name,
                              email: controller.studentFound.value[index].email,
                              department: controller
                                  .studentFound.value[index].department));
                        },
                        leading: CircleAvatar(
                          backgroundImage: FileImage(File(
                              controller.studentFound.value[index].imgurl!)),
                          radius: 25,
                        ),
                        title: Text(controller.studentFound.value[index].name),
                        subtitle: Text(
                            controller.studentFound.value[index].department),
                      ));
                    })))
          ],
        ));
  }
}
