

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/models/fourms_model.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/styles/styles.dart';

import '../../components/components.dart';
import 'create_post_screen.dart';


class DiscussionForumsAScreen extends StatelessWidget {
  var searchController = TextEditingController();
  var pageViewController = PageController();




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);

        List<Widget> allAndMyForumsScreens=[
          listOfPosts(allForums!),
          listOfPosts(myForums!),
        ];

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,size: 22,)),
            title: Center(
              child: Text(
                'Discussion Forums',
                style: GoogleFonts.roboto(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.profileDataModel!=null,
            builder: (context)=> Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 55.0,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: defaultTextFormField(
                        icon: Icons.search,
                        text: 'Search',
                        withBorder: false,
                        controller:searchController,
                        validator: (String ?value){
                          if(value!.isEmpty) return 'Enter any word';
                          return null;
                        }

                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  // button to navigate between two lists of forums
                  Container(
                    height: 35.0,
                    width: size.width,
                    child: Row(
                      children: [
                        MaterialButton(
                            minWidth: 130.0,
                            height: 35.0,
                            elevation: 0.8,
                            color: cubit.forumTabBarIndex==0 ? AppColors.greenColor : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: cubit.forumTabBarIndex==0 ? AppColors.greenColor : Color(0xff000000).withOpacity(0.13)) ,
                            ),
                            onPressed: (){
                              cubit.changeForumTabBarIndex(0);
                              pageViewController.jumpToPage(0);
                            },
                            child: Text(
                              'All Forums',
                              style:cubit.forumTabBarIndex==0 ? selectedTabBarStyle : unSelectedTabBarStyle,)
                        ),
                        const SizedBox(width: 20.0,),
                        MaterialButton(
                            minWidth: 130.0,
                            height: 35.0,
                            elevation: 0.8,
                            color: cubit.forumTabBarIndex==1 ? AppColors.greenColor : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: cubit.forumTabBarIndex==1 ? AppColors.greenColor : Color(0xff000000).withOpacity(0.13)) ,
                            ),
                            onPressed: (){
                              cubit.changeForumTabBarIndex(1);
                              pageViewController.jumpToPage(1);
                            },
                            child: Text(
                              'My Forums',
                              style:cubit.forumTabBarIndex==1 ? selectedTabBarStyle : unSelectedTabBarStyle,)
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  //page view that contain two pages of posts
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.forumsModel!=null,
                      builder:(context)=>  PageView.builder(
                        itemBuilder:(context,index)=> allAndMyForumsScreens[index] ,
                        itemCount: 2,
                        controller: pageViewController,
                        onPageChanged: (index){
                          cubit.changeForumTabBarIndex(index);
                        },
                        physics:const BouncingScrollPhysics(),
                      ),
                      fallback:(context)=>const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
                    ),
                  ),

                ],
              ),
            ),
            fallback:(context)=>const Center(child: CircularProgressIndicator(color: AppColors.greenColor,),),
          ),
                                         // floating action button that used to create new post.
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FloatingActionButton(
              onPressed: (){
                navigateTo(context, CreateNewPostcreen());
              },
               child: Icon(Icons.add),
              backgroundColor: AppColors.greenColor,
            ),
          ),
        );
      },
    );
  }


   var selectedTabBarStyle = GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 12.0, color: Colors.white);

   var unSelectedTabBarStyle = GoogleFonts.roboto(fontWeight: FontWeight.w500,fontSize: 12.0, color:const Color(0xff979797));
}
