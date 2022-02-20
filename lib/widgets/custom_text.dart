
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text ;
  double size ;
  Color color ;

  CustomText({
    this.color = Colors.black54 ,
    required this.text ,
    this.size=16 ,
}) ;

  @override
  Widget build(BuildContext context) {
    return Text(text , style: TextStyle(
      color: color ,
      fontSize: size ,
    ),);
  }
}
