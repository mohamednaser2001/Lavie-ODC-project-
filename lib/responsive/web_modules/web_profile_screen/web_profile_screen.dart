

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../../components/components.dart';
import '../../../styles/styles.dart';

class WebMyProfileScreen  extends StatelessWidget {
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var addressController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){

        AppCubit cubit =AppCubit.get(context);
        List<Widget> allAndMyForumsScreens=[
          Container(color: Colors.green,),
          Container(color: Colors.red,)
        ];

        return Padding(
          padding: EdgeInsets.all(size.width*0.04),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // header
                SizedBox(
                    height: 50.0,
                    child: headerTextOfWebScreens('My Profile')),

                // button to navigate between two lists of forums
                Container(
                  height: 35.0,
                  width: size.width,
                  child: Row(
                    children: [

                      switchButton(
                        text: 'Personal Information',
                        onPressed: (){
                          cubit.switchBetweenAllAndMyForumsInWeb(0);
                        },
                        index: 0,
                        underLineWidth: 175.0,
                      ),
                      const SizedBox(width: 40.0,),
                      switchButton(
                        text: 'Profile picture',
                        onPressed: (){
                          cubit.switchBetweenAllAndMyForumsInWeb(1);
                        },
                        index: 1,
                        underLineWidth: 135.0,
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 30.0,),

                SizedBox(height: 60.0, child: profilePointsCard(60.0)),
                const SizedBox(height: 30.0,),
                if(cubit.switchIndex==0)
                Expanded(
                     child: Container(
                       color: Colors.white,
                       child: Column(
                         children: [
                                             // row #1
                           Row(
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     headerOfTextFormField('First Name'),
                                     const SizedBox(height: 8.0,),
                                     defaultTextFormField(
                                       controller: firstNameController,
                                       validator: (value){
                                         if(value!.isEmpty) return 'Enter your first name';
                                       },
                                       height: 70.0,
                                     ),

                                   ],
                                 ),
                               ),
                               const SizedBox(width: 30.0,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     headerOfTextFormField('Last Name'),
                                     const SizedBox(height: 8.0,),
                                     defaultTextFormField(
                                       controller: lastNameController,
                                       validator: (value){
                                         if(value!.isEmpty) return 'Enter your last name';
                                       },
                                       height: 70.0,
                                     ),

                                   ],
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 30.0,),
                                                            // row #2
                           Row(
                             children: [
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     headerOfTextFormField('Email'),
                                     const SizedBox(height: 8.0,),
                                     defaultTextFormField(
                                       controller: firstNameController,
                                       validator: (value){
                                         if(value!.isEmpty) return 'Enter your email';
                                       },
                                       height: 70.0,
                                     ),

                                   ],
                                 ),
                               ),
                               const SizedBox(width: 30.0,),
                               Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     headerOfTextFormField('Address'),
                                     const SizedBox(height: 8.0,),
                                     defaultTextFormField(
                                       controller: lastNameController,
                                       validator: (value){
                                         if(value!.isEmpty) return 'Enter your address';
                                       },
                                       height: 70.0,
                                     ),

                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                 ),
                if(cubit.switchIndex==1)
                Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: addPhotoScope(
                        function: (){},
                        height:size.width*0.25,width: size.width*0.25,color: Colors.black.withOpacity(0.25), ),
                    ),
                ),

                defaultButton(
                    name: 'Save',
                    onPressed: (){},
                  height: 40.0,
                  width: 200.0,
                  radius: 10.0,
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Widget switchButton({
  required String text,
  required Function onPressed,
  required double underLineWidth,
    required int index
})=>BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){},
    builder: (context,state){
      AppCubit cubit = AppCubit.get(context);
      return TextButton(
        onPressed: (){
          onPressed();
        },
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: cubit.switchIndex==index ?AppStyles.loginOrSignupGreenStyle : AppStyles.loginOrSignupGreyStyle ,
            ),
            const SizedBox(height: 10.0,),
            if(cubit.switchIndex==index)
              Container(
                height: 2.5,
                width: underLineWidth,
                color:  AppColors.greenColor,
              ),
          ],
        ),
      );
    },
  );



}
