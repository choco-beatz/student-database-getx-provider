import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_database/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
          title: const Text(
            'SEARCH',
            style: TextStyle(color: white),
          ),
          backgroundColor: black,
        ),
      body: Column(
        children: [
          CupertinoSearchTextField(
            padding: EdgeInsets.all(10),
            prefixIcon: const Icon(
                Icons.search,
                color: black,
              ),
          )
        ],
      )
    );
  }
}