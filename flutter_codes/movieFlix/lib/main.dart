import 'package:flutter/material.dart';
import 'package:manhwaflix/screens/homeScreen.dart';

void main() {
  runApp(const ManhwaApp());
}

class ManhwaApp extends StatelessWidget {
  const ManhwaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
