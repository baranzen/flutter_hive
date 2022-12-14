import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../widgets/home/body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: HexColor('#293462'),
        appBar: AppBar(
          title: const Text('Hive Usage'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const HomePageBody(),
      );
}
