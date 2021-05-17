import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'package:bumptrade/widgets/widgets/header.dart';

class PortfolioHeadingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final String formattedDate = DateFormat('MMMMd').format(DateTime.now());

    return StandardHeader(
      title: 'Watchlist',
      action: GestureDetector(
        child: Icon(Icons.more_vert),
        onTap: () => Navigator.pushNamed(context, '/about')
      ),
    );
  }
}