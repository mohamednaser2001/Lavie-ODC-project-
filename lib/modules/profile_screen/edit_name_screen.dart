
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../styles/styles.dart';

class EditNameScreen extends  StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        firstNameController.text = cubit.profileDataModel!.data!.firstName! ;
        lastNameController.text = cubit.profileDataModel!.data!.lastName!;
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
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your first name';
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your last name';
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
                              cubit.updateUserName(
                                firstName : firstNameController.text,
                                  lastName : lastNameController.text,
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