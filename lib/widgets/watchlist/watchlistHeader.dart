import 'package:flutter/material.dart';
import 'package:bumptrade/widgets/widgets/header.dart';

class PortfolioHeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StandardHeader(
      title: 'Watchlist',
      action: GestureDetector(
        child: Icon(Icons.more_vert),
        onTap: () => Navigator.pushNamed(context, '/about')
      ),
    );
  }
}