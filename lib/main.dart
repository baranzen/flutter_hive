import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/students.dart';

void main() async {
  //! hive init
  await Hive.initFlutter('app');
  // app is the name of the folder //and its should be in top of the main function

  //! Encryption
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var containEncryptionKey = await secureStorage.containsKey(key: 'key');
  if (!containEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64Encode(key));
  }
  //! Encryption step 2
  var encryptinKey =
      base64Url.decode(await secureStorage.read(key: 'key') ?? "");
  print(encryptinKey);
  //! encryptionBox
  var encryptionBox = await Hive.openBox(
    'encryption',
    encryptionCipher: HiveAesCipher(encryptinKey),
  );
  await encryptionBox.put('secret', 'hive is cool!');

  //!
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
