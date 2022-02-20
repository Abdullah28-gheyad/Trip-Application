import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/layout_cubit/cubit.dart';
import 'package:trips/cubit/layout_cubit/states.dart';
import 'package:trips/modules/details_screen.dart';
import 'package:trips/modules/home_screen/services_classes/service_classes.dart';
import 'package:trips/widgets/components/place_widget.dart';
import 'package:trips/widgets/custom_bold_text.dart';
import 'package:trips/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    Map <String,dynamic>map  = {
      'balloning.png':'Ballonig' ,
      'hiking.png':'Hiking' ,
      'kayaking.png':'kayaking' ,
      'snorkling.png':'snorkling' ,
    } ;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context)  ;
                    },
                      child: Icon(Icons.menu)),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomBoldText(text: 'Discover'),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.indigo,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator:
                        CircleTabIndicator(color: Colors.indigo, radius: 3),
                    controller: tabController,
                    tabs: [
                      Tab(
                        text: 'Places',
                      ),
                      Tab(
                        text: 'Inspiration',
                      ),
                      Tab(
                        text: 'Emotions',
                      ),
                    ]),
              ),

              Container(
                padding: EdgeInsets.only(top: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: tabController, children: [
                  BlocConsumer<AppCubit,AppStates>(
                    listener: (context,state){},
                    builder: (context,state){
                      var cubit = AppCubit.get(context) ;
                      return ConditionalBuilder(
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                        builder:(context)=>ListView.separated(
                            physics: BouncingScrollPhysics(),
                            separatorBuilder: (context,index)=>SizedBox(width: 15,),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)=>InkWell(
                              onTap: (){
                                cubit.getStars = cubit.placeModel.elementAt(index).stars!;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(model: cubit.placeModel.elementAt(
                                    index),))) ;
                              },
                                child: PlaceWidget(model: cubit.placeModel.elementAt(index))),
                            itemCount: cubit.placeModel.length) ,
                        condition: cubit.placeModel.isNotEmpty,
                      ) ; 
              },
                  ) ,
                  Text('data'),
                  Text('data'),
                ]),
              ) ,
              SizedBox(height: 20,) ,
              Row(
                children: [
                  CustomBoldText(text: 'Explore more' ,size: 20,) ,
                  Spacer() ,
                  CustomText(text: 'See all') ,
                ],
              ) ,
              SizedBox(height: 20,) ,
              Container(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage('img/'+map.keys.elementAt(index)) ,
                                fit: BoxFit.cover
                            ) ,
                          ),
                        ) ,
                        SizedBox(height: 5,) ,
                        CustomText(text: map.values.elementAt(index))
                      ],

                    ),
                    separatorBuilder: (context,index)=>SizedBox(width: 20,),
                    itemCount: map.length
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


