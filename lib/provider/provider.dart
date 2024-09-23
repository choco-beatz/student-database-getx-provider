import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/model/student_model.dart';

class DBProvider extends ChangeNotifier {
  late Database database;
  List<Student> student = [];
  List<Student> studentFound = [];
  String imagePath = '';

//FOR IMMEDIATE DISPLAY OF IMAGE
  void imagePick(String path) {
    imagePath = path;
    notifyListeners();
  }

//TO CREATE A DATABASE AND CREATE AND UPDATE TABLE

  Future<void> initialize() async {
    database = await openDatabase(
      'student.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, department TEXT, imgurl TEXT, email TEXT)');
      },
    );
  }

//TO INSERT DATA FROM APP TO DATABASE

  Future<void> addStudent(Student val) async {
    try {
      await database.rawInsert(
        'INSERT INTO student(name, age, department, email, imgurl) VALUES (?, ?, ?, ?, ?)',
        [
          val.name,
          val.age,
          val.department,
          val.email,
          val.imgurl,
        ],
      );
      imagePath = '';
      notifyListeners();
      getStudents();
      log(val.toString());
    } catch (e) {
      print('Error adding student: $e');
    }
  }

//TO GET ALL DATA FROM DATABASE

  Future<void> getStudents() async {
    final result = await database.rawQuery('SELECT * FROM student');
    student.clear();
    for (var value in result) {
      student.add(Student.fromMap(value));
    }
    log(result.toString());
    studentFound = student;
    notifyListeners();
  }

//TO DELETE A student

  Future<void> deleteStudent(int id) async {
    await database.rawDelete('DELETE FROM student WHERE id = ?', [id]);
    getStudents();
  }

//TO UPDATE ANY RECORD

  Future<void> updateStudent(Student updated) async {
    await database.update(
        'student',
        {
          'name': updated.name,
          'age': updated.age,
          'department': updated.department,
          'email': updated.email,
          'imgurl': updated.imgurl
        },
        where: 'id=?',
        whereArgs: [updated.id]);
    notifyListeners();
    getStudents();
  }

  void search(String name) {
    List<Student> result = [];
    if (name.isEmpty) {
      studentFound = List.from(student);
      notifyListeners();
      return;
    }

    result = studentFound
        .where((element) =>
            element.name.toString().toLowerCase().contains(name.toLowerCase()))
        .toList();
    if (result.length != studentFound.length ||
        !result.every((student) => studentFound.contains(student))) {
      studentFound = result;
      imagePath = '';
      notifyListeners();
    }
  }

  void resetController() {
    student.clear();
    studentFound = [];
    imagePath = '';
    getStudents();
  }

  init() async {
    await initialize();
    await getStudents();
    studentFound = student;
  }
}
