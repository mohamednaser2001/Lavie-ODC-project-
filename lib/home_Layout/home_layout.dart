

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/modules/home_screen/home_screen.dart';
import 'package:lavie/modules/notification_screen.dart';
import 'package:lavie/modules/scanner_screen.dart';
import 'package:lavie/styles/styles.dart';

import '../modules/blogs_screen/blogs_screen.dart';
import '../modules/profile_screen/profile_screen.dart';

class HomeLayout extends  StatelessWidget {

  List<Widget>screens=[
    BlogsScreen(),
    ScanScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   // return BlocProvider(
    //  create: (BuildContext context)=>AppCubit()..getProductsData()..getBlogsData()..getPlantsData(),
     // child:
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body:SafeArea(child: screens[cubit.currentIndex]),
            bottomNavigationBar: CurvedNavigationBar(
              buttonBackgroundColor: AppColors.greenColor,
              backgroundColor: Colors.white,
              height: 60.0,
              color: Colors.white,
              index: cubit.currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              animationDuration: Duration(milliseconds: 250,),
              items: [
                CircleAvatar(
                  backgroundColor:cubit.currentIndex==0 ? AppColors.greenColor : Colors.white,
                  radius: 25.0,
                  child: Image.asset(
                    'assets/images/leaf_icon.png',
                    width: 24.0,
                    height: 24.0,
                    color:cubit.currentIndex==0 ? Colors.white : Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor:cubit.currentIndex==1 ? AppColors.greenColor : Colors.white,
                  radius: 25.0,
                  child: Image.asset(
                    'assets/images/scanner.png',
                    width: 24.0,
                    height: 24.0,
                    color:cubit.currentIndex==1 ? Colors.white : Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor:cubit.currentIndex==2 ? AppColors.greenColor : Colors.white,
                  radius: 25.0,
                  child: Image.asset(
                    'assets/images/home_icon.png',
                    width: 24.0,
                    height: 24.0,
                    color:cubit.currentIndex==2 ? Colors.white : Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor:cubit.currentIndex==3 ? AppColors.greenColor : Colors.white,
                  radius: 25.0,
                  child: Image.asset(
                    'assets/images/notification_icon.png',
                    width: 24.0,
                    height: 24.0,
                    color:cubit.currentIndex==3 ? Colors.white : Colors.black,
                  ),
                ),
                CircleAvatar(
                  backgroundColor:cubit.currentIndex==4 ? AppColors.greenColor : Colors.white,
                  radius: 25.0,
                  child: Image.asset(
                    'assets/images/person_icon.png',
                    width: 24.0,
                    height: 24.0,
                    color:cubit.currentIndex==4 ? Colors.white : Colors.black,
                  ),
                ),

              ],
            ),
          );
        },
      );
   // );
  }
}
