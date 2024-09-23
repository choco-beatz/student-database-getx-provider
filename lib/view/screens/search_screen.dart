import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_database/constants/colors.dart';
import 'package:student_database/provider/provider.dart';
import 'package:student_database/view/screens/profile_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DBProvider>(builder: (context, searchValue, child) {
      
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
                padding: EdgeInsets.all(10),
                child: Theme(
                  data: ThemeData(
                      cupertinoOverrideTheme:
                          const CupertinoThemeData(primaryColor: black)),
                  child: CupertinoSearchTextField(
                    onChanged: (value) {
                      searchValue.search(value);
                    },
                    padding: const EdgeInsets.all(10),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: black,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: searchValue.studentFound.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                        image:
                                            searchValue.student[index].imgurl,
                                        name: searchValue.student[index].name,
                                        department: searchValue
                                            .student[index].department,
                                        email:
                                            searchValue.student[index].email)));
                          },
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                                File(searchValue.studentFound[index].imgurl)),
                            radius: 25,
                          ),
                          title: Text(searchValue.studentFound[index].name),
                          subtitle:
                              Text(searchValue.studentFound[index].department),
                        ));
                      }))
            ],
          ));
    });
  }
}
