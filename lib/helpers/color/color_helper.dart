import 'package:flutter/material.dart';
import 'package:bumptrade/shared/colors.dart';

Color determineColorBasedOnChange(double change ) {
  return change < 0 
    ? kNegativeColor 
    : PositiveColor;
}

TextStyle determineTextStyleBasedOnChange(double change ) {
  return change < 0 
    ?  kNegativeChange
    : kPositiveChange;
}

const TextStyle kPositiveChange = const TextStyle(
  color:Colors.greenAccent,
  fontSize: 16,
  fontWeight: FontWeight.w800
);

const TextStyle kNegativeChange = const TextStyle(
  color: kNegativeColor,
  fontSize: 16,
  fontWeight: FontWeight.w800
);
