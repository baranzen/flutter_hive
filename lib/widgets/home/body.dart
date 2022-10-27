import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../models/students.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});
  String name = 'baran';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: customData,
            child: const Text(
              'click',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  customData() async {
    var box = Hive.box<Student>('students');
    await box.clear();
    var baran = Student('baran', EyeColor.blue);
    box.add(baran);
    debugPrint(box.toMap().toString());
  }

  Future<void> onButtonPress() async {
    var box = Hive.box('test');
    await box.clear();
    box.add('baran'); //! index 0, value 0
    box.add('zengeralp'); //! index 1, value 1
    box.add(true); //! index 2, value 2
    box.add(123); //! index 3, value 3
    await box.put('theme', 'dark');
    //! for read
    /*   box.values.forEach((element) => debugPrint(element.toString())); */
    debugPrint(box.toMap().toString());
    debugPrint(box.get(1));
    debugPrint(box.getAt(1));
  }
}
