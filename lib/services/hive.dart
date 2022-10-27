import 'package:hive_flutter/hive_flutter.dart';

import '../models/students.dart';

Future<void> hive() async {
  await Hive.initFlutter('app');
  await Hive.openBox('test');
  Hive.registerAdapter(StudentAdapter());
  Hive.registerAdapter(EyeColorAdapter());
  await Hive.openBox<Student>('students');
}
