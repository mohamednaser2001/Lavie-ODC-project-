


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/login_screen/login_and_register_pages/login_page.dart';
import 'package:lavie/modules/login_screen/login_and_register_pages/register_page.dart';
import 'package:lavie/modules/login_screen/login_cubit.dart';
import 'package:lavie/modules/login_screen/login_states.dart';
import 'package:lavie/styles/styles.dart';

import '../../components/components.dart';
import '../../tests/login_page_class.dart';

class LoginScreen extends StatelessWidget {
 static var emailController = TextEditingController();
 static var passwordController = TextEditingController();
  var onBoardController = PageController();
 static var formKey = GlobalKey<FormState>();

 static var registerEmailController = TextEditingController();
 static var registerPasswordController = TextEditingController();
 static var confirmPasswordController = TextEditingController();
 static var firstNameController = TextEditingController();
 static var lastNameController = TextEditingController();

  List<Widget> screens=[
    RegisterPage(),
    LoginPage(),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(           // the leaf image in the bottom
                    alignment: Alignment.topRight,
                    height: size.height*0.15,
                    color: Colors.white.withOpacity(0.0),
                    child:const Image(
                      image: AssetImage('assets/images/leaf.png'),
                    ),
                  ),
                  if(size.width<500) logoBuilder(size),                // logo of app
                  if(size.width<500) SizedBox(height: size.height*0.06,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 75.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: (){
                              cubit.switchBetweenLoginAndRegister(0);
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Sign up',
                                  textAlign: TextAlign.center,
                                  style: cubit.isLogin ? AppStyles.loginOrSignupGreyStyle : AppStyles.loginOrSignupGreenStyle,
                                ),
                                const SizedBox(height: 4.0,),
                                if(cubit.isLogin==false)
                                Container(
                                  height: 2.5,
                                  width: 60.0,
                                  color:  AppColors.greenColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: (){
                              cubit.switchBetweenLoginAndRegister(1);
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style:cubit.isLogin ? AppStyles.loginOrSignupGreenStyle : AppStyles.loginOrSignupGreyStyle,
                                ),
                                const SizedBox(height: 4.0,),
                                if(cubit.isLogin)
                                Container(
                                  height: 2.5,
                                  width: 50.0,
                                  color:  AppColors.greenColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if(size.width>=500) SizedBox(height: size.height*0.05,),
                  Expanded(
                    child: Container(
                      width: size.width>500 ? double.infinity : 337,
                      padding: EdgeInsets.symmetric(horizontal:size.width>500 ? size.width*0.25 : 0.0),
                      child: PageView.builder(
                        itemBuilder: (context,index) => cubit.isLogin ? screens[1] : screens[0],

                        onPageChanged: (index){
                          cubit.switchBetweenLoginAndRegister(index);
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: screens.length,
                        controller: onBoardController,

                      ),
                    ),
                  ),

                  if(size.width<500)
                  Container(           // the leaf image in the bottom
                    alignment: Alignment.bottomLeft,
                    height: size.height*0.13,
                    color: Colors.white.withOpacity(0.0),
                    child:const Image(
                      image: AssetImage('assets/images/upside_down_leaf.png'),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
