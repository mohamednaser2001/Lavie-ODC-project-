

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/home_screen.dart';
import 'package:lavie/modules/login_screen/login_cubit.dart';
import 'package:lavie/modules/login_screen/login_states.dart';
import 'package:lavie/responsive/responsive.dart';
import 'package:lavie/web_designs/web_layout/web_layout.dart';

import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../home_Layout/home_layout.dart';
import '../../../shared/local/cache_helper.dart';
import '../../../styles/styles.dart';

class LoginPage extends  StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginSuccessState){
          token = state.model.data!.accessToken;
          CacheHelper.saveData(key: 'token', value: token);
          navigateToWithoutBack(context,ResponsiveLayout(mobileScaffold: HomeLayout(), webScaffold: WebLayout()));
        }
      },
      builder: (context,state){
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: AppStyles.headerOfTextFormFieldStyle,
              ),
              const SizedBox(height: 4.0,),

              defaultTextFormField(
                  controller:emailController,
                  validator: (String ?value){
                    if(value!.isEmpty) return 'Enter email address';
                    return null;
                  }
              ),

              const SizedBox(height: 20.0,),
              Text(
                'Password',
                style: AppStyles.headerOfTextFormFieldStyle,
              ),
              const SizedBox(height: 4.0,),
              defaultTextFormField(
                  controller:passwordController,
                  validator: (String? value){
                    if(value!.isEmpty) return 'Enter password';
                    else return null;
                  }
              ),
              const SizedBox(height: 40.0,),
              defaultButton(
                  name: 'Login',
                  onPressed: (){
                    if(formKey.currentState!.validate()) {
                      cubit.getUserData(email: emailController.text, password: passwordController.text);
                    }
                  }
              ),
              const SizedBox(height: 1.5,),
              if(state is LoginLoadingState)
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

