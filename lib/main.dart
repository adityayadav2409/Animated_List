import 'package:flutter/material.dart';

import 'package:animated_list/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ('Animated List '),
      theme: ThemeData.light().copyWith(),
      home: const AnimatedListExample(),
    );
  }
}
