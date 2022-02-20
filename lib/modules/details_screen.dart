import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/layout_cubit/cubit.dart';
import 'package:trips/cubit/layout_cubit/states.dart';
import 'package:trips/models/places_model.dart';
import 'package:trips/widgets/custom_bold_text.dart';
import 'package:trips/widgets/custom_button.dart';
import 'package:trips/widgets/custom_buttons.dart';
import 'package:trips/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  PlaceModel model ;
   DetailsScreen({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    left: 0,
                    child: Image(
                      image:NetworkImage('http://mark.bslmeiyu.com/uploads/'+model.img!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 350,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0, left: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context) ;
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 500,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomBoldText(text: model.name!),
                                Spacer(),
                                CustomBoldText(
                                  text: '\$ ${model.price!}',
                                  color: Colors.indigo,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.indigo,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  text: model.location!,
                                  size: 13,
                                  color: Colors.indigo[400]!,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            Icons.star,
                                            color: index < cubit.getStars
                                                ? Colors.amberAccent
                                                : Colors.grey,
                                            size: 20,
                                          )),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(text: model.stars!.toString())
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomBoldText(
                              text: 'People',
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomText(
                              text: 'Number of people in your group',
                              size: 13,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => InkWell(
                                        onTap: () {
                                          cubit.changeSelectedIndex(index);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: CustomButtons(
                                            borderColor:
                                                cubit.selectedIndex == index
                                                    ? Colors.black
                                                    : Colors.grey[300]!,
                                            backgroundColor:
                                                cubit.selectedIndex == index
                                                    ? Colors.black
                                                    : Colors.grey[300]!,
                                            size: 45,
                                            text: (index + 1).toString(),
                                            textColor:
                                                cubit.selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                          ),
                                        ),
                                      )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomBoldText(
                              text: 'Description',
                              size: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text:
                                  model.description!,
                              size: 14,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                CustomButtons(
                                    borderColor: Colors.grey[300]!,
                                    backgroundColor: Colors.white,
                                    size: 50 ,
                                textColor: Colors.black,
                                icon: Icons.favorite_border,
                                isIcon: true,) , 
                                SizedBox(width: 10,) , 
                                Expanded( child: CustomButton(onTap: (){} , text: 'Book Trip Now', ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
