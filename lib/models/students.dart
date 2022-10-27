import 'package:hive/hive.dart';
part 'students.g.dart';

@HiveType(typeId: 1)
class Student {
  Student(this.nmame, this.eyeColor);
  @HiveField(0)
  final int id = 001;
  @HiveField(1)
  final String nmame;
  @HiveField(2)
  final EyeColor eyeColor;

  @override
  String toString() {
    return '$id - $nmame - $eyeColor';
  }
}

@HiveType(typeId: 2)
enum EyeColor {
  @HiveField(0)
  blue,
  @HiveField(1)
  green,
  @HiveField(2)
  pink,
}
