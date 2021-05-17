import 'package:flutter/material.dart';
import 'package:bumptrade/widgets/about/aboutBody.dart';


class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('About'),
          backgroundColor: Colors.blueGrey,
        ),

        backgroundColor: Colors.lightBlue[50],
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              Attributions(), 
            ],
          ),
        )
      ),
    );
  }
}