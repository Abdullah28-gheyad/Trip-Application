import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/layout_cubit/states.dart';
import 'package:trips/models/places_model.dart';
import 'package:trips/modules/bar_screen.dart';
import 'package:trips/modules/home_screen/home_screen.dart';
import 'package:trips/modules/profile_screen.dart';
import 'package:trips/modules/search_screen.dart';
import 'package:trips/shared/network/dio_helper.dart';
import 'package:trips/shared/network/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  List<Widget> pages = [
    HomeScreen(),
    BarScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  int getStars = 4 ;
  int selectedIndex = 0 ;
  void changeSelectedIndex (int index)
  {
    selectedIndex = index ;
    emit(ChangeSelectedIndexState()) ;
  }

   List <PlaceModel> placeModel =[] ;
  void getPlaces ()
  {
    DioHelper.getData(path: PLACES)
        .then((value) {
            value.data.forEach((e){
              print (e.toString()) ;
            placeModel.add(PlaceModel.fromJson(e)) ;
           }) ;
         // print (value.data.toString()) ;
          emit(GetPlacesDataSuccessState()) ;
    })
        .catchError((error){
          print (error.toString()) ;
          emit(GetPlacesDataErrorState()) ;
    }) ;
  }

}
