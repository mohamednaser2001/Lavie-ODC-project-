

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/styles/styles.dart';

import '../../components/components.dart';

class CreateNewPostcreen extends  StatelessWidget {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 22,)),
            title: Center(
              child: Text(
                'Create New Post',
                style: GoogleFonts.roboto(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // add photo here
                    Center(
                      child: addPhotoScope(
                        width: 130.0, height: 130.0,
                      function: (){
                          AppCubit.get(context).uploadImage();
                      }
                      ),
                    ),
                    const SizedBox(height: 30.0,),

                    Text(
                      'Title',
                      style: AppStyles.headerOfTextFormFieldStyle,
                    ),
                    const SizedBox(height: 8.0,),

                    defaultTextFormField(
                        controller:titleController,
                        validator: (String ?value){
                          if(value!.isEmpty) return 'Enter title of post';
                          return null;
                        }
                    ),

                    const SizedBox(height: 20.0,),
                    Text(
                      'Description',
                      style: AppStyles.headerOfTextFormFieldStyle,
                    ),
                    const SizedBox(height: 8.0,),
                    defaultTextFormField(
                      controller:descriptionController,
                      validator: (String? value){
                        if(value!.isEmpty) return 'Enter description of post';
                        else return null;
                      },
                      isDescription: true,
                      height: 170.0,
                    ),
                    MaterialButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()&&AppCubit.get(context).base64string!=null){
                          AppCubit.get(context).createPost(
                            title: titleController.text,
                            image: AppCubit.get(context).base64string,
                            description: descriptionController.text,
                          );
                        }

                      },
                      color: AppColors.greenColor,
                      height: 41.0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Post',
                        style: AppStyles.buttonStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}
