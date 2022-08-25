



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/login_screen/login_cubit.dart';
import 'package:lavie/modules/login_screen/login_states.dart';
import 'package:lavie/styles/styles.dart';

import '../../components/components.dart';

class TestScreen extends StatelessWidget {
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  var onBoardController = PageController();
  static var formKey = GlobalKey<FormState>();



  List<Widget> screens=[
    allCategoriesPage(),
    plantsPage(),
    seedsPage(),
    toolsPage(),
  ];
  List<Widget>categoriesHeaders=[
    TextButton(
      onPressed: (){

      },
      child: Text(
        'Login',
        textAlign: TextAlign.center,
       // style:cubit.isLogin ? AppStyles.loginOrSignupGreenStyle : AppStyles.loginOrSignupGreyStyle,
      ),
    ),
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
              child: SafeArea(
                child: Column(
                  children: [
                    logoBuilder(size),
                    SizedBox(height: size.height*0.06,),// logo of app
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                print('taped');
                              },
                              child: Container(
                                height: 46.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: AppColors.backgroundOfTextFormFieldColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.search,color: AppColors.smallGreyOfLoginScreenColor97,),
                                      const SizedBox(width: 15.0,),
                                      Text(
                                        'Search',
                                        style: AppStyles.searchAndTapBarStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 14.0,),
                          Container(
                            height: 46.0,
                            width: 51.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.greenColor,
                            ),
                            child: MaterialButton(
                                onPressed: (){},
                                child: Image.asset('assets/images/shopping_cart_logo.png',width: 24.0,height: 24.0,)
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 75.0),
                      child: Row(
                        children: [
                          Container(
                            width: 90.0,
                            height: 35.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppColors.backgroundOfTextFormFieldColor,
                                border: Border.all(color: AppColors.greenColor,width: 2.0),
                            ),
                            child: TextButton(
                              clipBehavior: Clip.antiAliasWithSaveLayer,

                              onPressed: (){
                                cubit.switchBetweenLoginAndRegister(0);
                              },
                              child: Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: cubit.isLogin ? AppStyles.searchAndTapBarStyle : AppStyles.selectedItemInTabBarStyle,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              cubit.switchBetweenLoginAndRegister(1);
                            },
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                              style:cubit.isLogin ? AppStyles.loginOrSignupGreenStyle : AppStyles.loginOrSignupGreyStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Expanded(
                      child: Container(
                        color: Colors.white70,
                        width: 337,
                        child: PageView.builder(
                          itemBuilder: (context,index) => screens[1],

                          onPageChanged: (index){
                            cubit.switchBetweenLoginAndRegister(index);
                          },
                          physics:const BouncingScrollPhysics(),
                          itemCount: screens.length,
                          controller: onBoardController,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
