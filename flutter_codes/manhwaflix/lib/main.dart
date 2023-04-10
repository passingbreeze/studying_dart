import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // flutter codes are composition of Widgets
  // start point of entire app
  @override
  Widget build(BuildContext context) {
    // build UI method : build
    return MaterialApp(
      home: Scaffold(
        // Widget들을 조립하는데 중요한 Widget
        appBar: AppBar(
          title: Text('Hello flutter!'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
