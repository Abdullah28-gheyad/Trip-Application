import 'package:flutter/material.dart';
import 'package:trips/models/places_model.dart';

class PlaceWidget extends StatelessWidget {
  PlaceModel model ;

   PlaceWidget({Key? key , required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20) ,
        image: DecorationImage(
            image: NetworkImage('http://mark.bslmeiyu.com/uploads/'+model.img!) ,
            fit: BoxFit.cover
        ) ,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ) ;
  }
}
