import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/layout_cubit/cubit.dart';
import 'package:trips/cubit/layout_cubit/states.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context) ;
        return Scaffold(
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            currentIndex: cubit.currentIndex,
            onTap: (int index){
              cubit.changeBottomNav(index) ;
            },
            elevation: 0,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.apps) , label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp) , label: 'Bar'),
              BottomNavigationBarItem(icon: Icon(Icons.search) , label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.person) , label: 'Profile'),
            ],
          ),
        ) ;
    },
    );
  }
}
