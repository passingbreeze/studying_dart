import 'package:flutter/material.dart';
import 'package:movieflix/screens/home_screen.dart';

void main() {
  runApp(const MovieFlix());
}

class MovieFlix extends StatelessWidget {
  const MovieFlix({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
