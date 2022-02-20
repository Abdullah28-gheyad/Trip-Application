import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trips/layout/app_layout_screen.dart';
import 'package:trips/widgets/custom_bold_text.dart';
import 'package:trips/widgets/custom_button.dart';
import 'package:trips/widgets/custom_text.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  _WelcomePageScreenState createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
  List<String> images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
           physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index){
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('img/'+images[index] ) ,
                     fit: BoxFit.cover
                   )
                 ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 150.0 , left: 20 , right: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBoldText(text: 'Trips') ,
                          CustomText(text: 'Mountain' , size: 30,) ,
                          const SizedBox(height: 20,) ,
                          SizedBox(
                            width: 250,
                              child: CustomText(text: 'Mountain hikes give you an incredible sense of freedom along with endurance test ' , size: 14,color: Colors.grey,)),
                          const SizedBox(height: 40,) ,
                          CustomButton(
                          text: '',
                            onTap: (){
                            print ('hahahaha') ;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AppLayoutScreen()));
                          } , ) ,
                        ],
                      )  ,
                      Spacer() ,
                      Column(
                        children: List.generate(3, (indexDots) {
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              height: index==indexDots?25:8,
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==indexDots?Colors.indigo:Colors.grey,
                              ),
                            ),
                          ) ;
                        } ),
                      )


                    ],
                  ),
                ),
              ) ;
            }
        ),
    );
  }
}
