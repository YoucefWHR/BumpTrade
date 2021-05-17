import 'package:flutter/material.dart';
import 'package:bumptrade/shared/colors.dart';

class BaseList extends StatelessWidget {

  final List<Widget> children;

  BaseList({
    @required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: this.children
        )
      )
    );
  }
}