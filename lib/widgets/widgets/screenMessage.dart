import 'package:flutter/material.dart';
import 'package:bumptrade/shared/colors.dart';

class EmptyScreen extends StatelessWidget {

  final String message;

  EmptyScreen({
    this.message
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
        height: 1.5,
        fontSize: 20, 
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      textAlign: TextAlign.start,
    );
  }
}