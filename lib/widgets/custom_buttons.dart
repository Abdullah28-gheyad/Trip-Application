import 'package:flutter/material.dart';
import 'package:trips/widgets/custom_text.dart';

class CustomButtons extends StatelessWidget {
  double size  ; 
  Color backgroundColor ;
  Color? textColor ;
  Color borderColor ; 
  String? text ; 
  IconData? icon ; 
  bool? isIcon ;
  CustomButtons({Key? key,
    this.textColor=Colors.black,
    this.text='' ,
    this.icon = Icons.favorite ,
    this.isIcon = false  ,
    required this.borderColor ,
    required this.backgroundColor ,
    required this.size ,
}) : super(key: key) ;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color:backgroundColor ,
        border: Border.all(
          color: borderColor
        ),
        borderRadius: BorderRadius.circular(10) ,
      ),
      child: isIcon!?Center(child: Icon(icon , size: 20,color: textColor,)):Center(child: CustomText(text: text!, color: textColor!,)),
    );
  }
}
