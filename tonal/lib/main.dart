/**
 * The file from where all files are maintained
 */

import 'package:flutter/material.dart';
import 'package:tonal/Views/display.dart';
import 'package:tonal/Views/editScreen.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Display(),
        '/editScreen': (context) => EditScreen()
      },
      );
      
  }
}
