import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:hive/hive.dart';

import '../../models/students.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String name = 'baran';
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? CircularProgressIndicator(
                  color: HexColor('#5837D0'),
                )
              : TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(HexColor('#5837D0')),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: layzBox,
                  child: const Text(
                    'click',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  var numbers = Hive.lazyBox<int>('numbers');

  Future<void> layzBox() async {
    setState(() => isLoading = true);
    numbers.clear();
    for (var i = 0; i < 100; i++) {
      await numbers.add(i);
    }
    for (var i = 0; i < 100; i++) {
      print(await numbers.getAt(i)); // debug print kullaninca hata verdi
    }
    setState(() => isLoading = false);
    print('done');

    // snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('done'),
        backgroundColor: HexColor('#5837D0'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
