import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/layout_cubit/cubit.dart';
import 'package:trips/shared/network/dio_helper.dart';

import 'cubit/bloc_observer.dart';
import 'modules/details_screen.dart';
import 'modules/welcome_screen.dart';

void main() {
  BlocOverrides.runZoned(
        () {
          DioHelper.init() ;
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getPlaces(),
      child : const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: WelcomePageScreen()
      ),
    );
  }
}


