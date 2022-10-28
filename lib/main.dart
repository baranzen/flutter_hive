import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/students.dart';

void main() async {
  await Hive.initFlutter('app');
  await Hive.openBox('test');
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(EyeColorAdapter());
  await Hive.openBox<Student>('students');
  await Hive.openLazyBox<int>('numbers');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter hive',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}
