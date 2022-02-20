import 'package:flutter/material.dart';
import 'package:trips/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {

  String? text ;
  Function onTap ;

  CustomButton({this.text='',required this.onTap}) ;
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(.87) ,
          borderRadius: BorderRadius.circular(10) ,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(text: text! , color: Colors.white,) ,
            Image(image: AssetImage('img/button-one.png')) ,
          ],
        ),
      ),
    );
  }
}
