
import 'package:flutter/material.dart';

class CustomBoldText extends StatelessWidget {
  String text ;
  double size ;
  Color color ;

  CustomBoldText({
    this.color = Colors.black ,
    required this.text ,
    this.size=30
  }) ;

  @override
  Widget build(BuildContext context) {
    return Text(text , style: TextStyle(
      fontWeight: FontWeight.bold,
      color: color ,
      fontSize: size ,
    ),);
  }
}
