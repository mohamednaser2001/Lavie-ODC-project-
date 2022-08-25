
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../styles/styles.dart';

class EditEmailScreen extends  StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        emailController.text = cubit.profileDataModel!.data!.email! ;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: Colors.black,)),
            title:const Text(
              'Update Profile',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your email';
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        padding:const EdgeInsets.symmetric(horizontal: 40.0),
                        child: MaterialButton(
                          height: 48.0,
                          color: AppColors.greenColor,
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              cubit.updateUserEmail(
                                email : emailController.text,
                              );
                            }
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.edit,color: Colors.white,size: 20.0),
                              Expanded(
                                child: Text(
                                  'update',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}