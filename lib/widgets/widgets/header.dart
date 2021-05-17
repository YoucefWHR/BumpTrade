import 'package:flutter/material.dart';

class StandardHeader extends StatelessWidget {

  final String title;
  
  final Widget action;
  
  StandardHeader({
    @required this.title,
   
    @required this.action
  });

  static const kPortfolioHeaderTitle = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700
  );

  // static const kPortfolioSubtitle = const TextStyle(
  //   color: Colors.blueGrey,
  //   fontSize: 24,
  //   height: 1.5,
  //   fontWeight: FontWeight.bold
  // );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 10, child: Text(this.title, style: kPortfolioHeaderTitle),),
            this.action
          ],
        ),

       // Text(this.subtitle, style: kPortfolioSubtitle),
      ],
    );
  }
}