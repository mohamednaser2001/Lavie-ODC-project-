

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/modules/login_screen/login_cubit.dart';
import 'package:lavie/modules/login_screen/login_states.dart';

import '../../../components/components.dart';
import '../../../home_Layout/home_layout.dart';
import '../../../styles/styles.dart';

class RegisterPage extends  StatelessWidget {
   var registerEmailController = TextEditingController();
   var registerPasswordController = TextEditingController();
   var confirmPasswordController = TextEditingController();
   var firstNameController = TextEditingController();
   var lastNameController = TextEditingController();
   var registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is RegisterSuccessState){
          token = state.model.data!.accessToken;
          navigateToWithoutBack(context, HomeLayout());
        }
      },
      builder: (context,state){
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: registerFormKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First name',
                          style: AppStyles.headerOfTextFormFieldStyle,
                        ),
                        const SizedBox(height: 4.0,),
                        defaultTextFormField(
                            controller:firstNameController,
                            validator: (String ? value){
                              if(value!.isEmpty) return 'Enter first name';
                            }
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last name',
                          style: AppStyles.headerOfTextFormFieldStyle,
                        ),
                        const SizedBox(height: 4.0,),
                        defaultTextFormField(controller:lastNameController,
                            validator: (String ? value){
                              if(value!.isEmpty) return 'Enter second name';
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Email',
                style: AppStyles.headerOfTextFormFieldStyle,
              ),
              const SizedBox(height: 4.0,),

              defaultTextFormField(
                  controller:registerEmailController,
                  validator: (String ? value){
                    if(value!.isEmpty) return 'Enter email address';
                  }
              ),

              const SizedBox(height: 20.0,),
              Text(
                'Password',
                style: AppStyles.headerOfTextFormFieldStyle,
              ),
              const SizedBox(height: 4.0,),
              defaultTextFormField(controller:registerPasswordController,
                  validator: (String ? value){
                    if(value!.isEmpty) return 'Enter password';
                  }
              ),
              const SizedBox(height: 20.0,),
              Text(
                'Confirm password',
                style: AppStyles.headerOfTextFormFieldStyle,
              ),
              const SizedBox(height: 4.0,),
              defaultTextFormField(controller:confirmPasswordController,
                  validator: (String ? value){
                    if(value!.isEmpty) return 'Enter password';
                    if(registerPasswordController.text!=confirmPasswordController.text){
                      return 'Passwords do not match';
                    }
                  }
              ),

              const SizedBox(height: 40.0,),
              defaultButton(
                  name: 'Register',
                  onPressed: (){
                    if(registerFormKey.currentState!.validate()){
                      cubit.registerNewUser(
                          email: registerEmailController.text,
                          password: registerPasswordController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text
                      );
                    }
                  }
              ),
              const SizedBox(height: 1.5,),
              if(state is RegisterLoadingState)
                const LinearProgressIndicator(color: AppColors.greenColor,backgroundColor: Colors.white,),

              const SizedBox(height: 24.0,),
              Container(
                width: 337,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(height: 1.0,color: AppColors.smallGreyOfLoginScreenColor97,)),
                    Text(
                      '  or continue with  ',
                      style: AppStyles.smallGreyOfLoginScreenStyle,
                    ),
                    Expanded(
                        child: Container(height: 1.0,color: AppColors.smallGreyOfLoginScreenColor97,)),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                width: 337,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        width: 24.0,
                        height: 24.0,
                        image: AssetImage('assets/images/google.png'),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  Image(
                        image: AssetImage('assets/images/facebook.png'),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
