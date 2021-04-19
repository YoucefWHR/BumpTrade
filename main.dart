
import 'package:flutter/material.dart';
import 'package:bumptrade/NAVIGATION.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest API Demo',
    

        // Define the default font family
      home: MyHomePage(),
    );
  }
}

