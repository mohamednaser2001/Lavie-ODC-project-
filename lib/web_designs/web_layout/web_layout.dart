

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/components/components.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/modules/login_screen/login_screen.dart';
import 'package:lavie/modules/quiz_screen/quiz_screen.dart';
import 'package:lavie/styles/styles.dart';

import '../../modules/home_screen/home_screen.dart';
import '../../responsive/web_modules/descussion_forums/descussion_forums_screen.dart';
import '../../responsive/web_modules/home_screen.dart';
import '../../responsive/web_modules/shop_screen/shop_screen.dart';
import '../../responsive/web_modules/web_blogs_screens/web_blogs_screen.dart';
import '../../responsive/web_modules/web_my_cart_screen.dart';
import '../../responsive/web_modules/web_profile_screen/web_profile_screen.dart';



class WebLayout extends StatelessWidget {

  List<Widget> screens =[
    HomeWebScreen(),
    WebShopScreen(),
    WebBlogsScreen(),
    WebDiscussionForumScreen(),
    WebMyCartScreen(),
    WebMyProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                titleSpacing: 20.0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    logoBuilder(null),
                    SizedBox(width: size.width*0.10,),
                    TextButton(
                      onPressed: (){
                        cubit.changeWebAppBarIndex(0);
                        cubit.changeSelectedHeaderIndex(0);
                      },
                      child: Text(
                        'Home',
                        style:cubit.selectedHeaderIndex==0 ? AppStyles.greenHeadersOfWebStyle : AppStyles.headersOfWebStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        cubit.changeWebAppBarIndex(1);
                        cubit.changeSelectedHeaderIndex(1);
                      },
                      child: Text(
                        'Shop',
                        style:cubit.selectedHeaderIndex==1 ? AppStyles.greenHeadersOfWebStyle : AppStyles.headersOfWebStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        cubit.changeWebAppBarIndex(2);
                        cubit.changeSelectedHeaderIndex(2);
                      },
                      child: Text(
                        'Blogs',
                        style:cubit.selectedHeaderIndex==2 ? AppStyles.greenHeadersOfWebStyle : AppStyles.headersOfWebStyle,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        cubit.changeWebAppBarIndex(3);
                        cubit.changeSelectedHeaderIndex(3);
                      },
                      child: Text(
                        'Community',
                        style:cubit.selectedHeaderIndex==3 ? AppStyles.greenHeadersOfWebStyle : AppStyles.headersOfWebStyle,
                      ),
                    ),
                    SizedBox(width: size.width*0.05,),
                  ],
                ),
                actions: [
                  Container(
                    width: 80.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/shopping_cart_logo.png',
                            color: Colors.black,
                            width: 20.0,
                            height: 17.5,
                          ),
                         onTap: (){
                            cubit.changeWebAppBarIndex(4);
                         },
                        ),
                        Image.asset(
                          'assets/images/notification_icon.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                        GestureDetector(
                          child: Image.asset(
                            'assets/images/profile3.png',
                            width: 20.0,
                            height: 20.0,
                          ),
                          onTap: (){
                            cubit.changeWebAppBarIndex(5);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width*0.03,),
                ],
              ),
              body: screens[cubit.webAppBarIndex],
            ),
            Positioned(
                right: 80.0,
              top: 110.0,
                child: GestureDetector(
                  onTap: (){
                    navigateTo(context,
                        QuizScreen());
                  },
                  child:const CircleAvatar(
                    radius: 14.0,
                    backgroundColor: AppColors.greenColor,
                    child: Icon(Icons.question_mark_outlined,color: Colors.white,),
                  ),
                ),
            ),
          ],
        );
       },
    );
  }




}
