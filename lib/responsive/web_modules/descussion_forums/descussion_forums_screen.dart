

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../../components/components.dart';
import '../../../styles/styles.dart';

class WebDiscussionForumScreen  extends StatelessWidget {

  var searchController = TextEditingController();
  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){

        AppCubit cubit =AppCubit.get(context);
        List<Widget> allAndMyForumsScreens=[
          testListOfPosts(),
          testListOfPosts(),
        ];

        return Padding(
          padding: EdgeInsets.all(size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // header
              Text(
                'Forums',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40.0,),
              // button to navigate between two lists of forums
              Container(
                height: 35.0,
                width: size.width,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: (){
                        cubit.switchBetweenAllAndMyForumsInWeb(0);
                      },
                      child: Column(
                        children: [
                          Text(
                            'All Forums',
                            textAlign: TextAlign.center,
                            style: cubit.switchIndex==1 ? AppStyles.loginOrSignupGreyStyle : AppStyles.loginOrSignupGreenStyle,
                          ),
                          const SizedBox(height: 10.0,),
                          if(cubit.switchIndex==0)
                            Container(
                              height: 2.5,
                              width: 130.0,
                              color:  AppColors.greenColor,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40.0,),
                    TextButton(
                      onPressed: (){
                        cubit.switchBetweenAllAndMyForumsInWeb(1);
                      },
                      child: Column(
                        children: [
                          Text(
                            'My Forums',
                            textAlign: TextAlign.center,
                            style: cubit.switchIndex==0 ? AppStyles.loginOrSignupGreyStyle : AppStyles.loginOrSignupGreenStyle,
                          ),
                          const SizedBox(height: 10.0,),
                          if(cubit.switchIndex==1)
                            Container(
                              height: 2.5,
                              width: 130.0,
                              color:  AppColors.greenColor,
                            ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 30.0,),


              Expanded(
                child: Row(
                  children: [
                    // list of cart items
                    Container(
                      width: size.width*0.55,
                      //height: size.height*0.70,
                      child: Expanded(
                        child: cubit.switchIndex==0 ? allAndMyForumsScreens[0] : allAndMyForumsScreens[1],
                      ),
                    ),
                    Spacer(),

                    Container(
                      width: size.width*0.22,
                      height: size.height*0.45,
                      alignment: Alignment.center,
                      padding:const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1.0,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0
                          ),
                          BoxShadow(
                              color: Colors.grey[200]!,
                              spreadRadius: 1.0,
                              offset:const Offset(-2.0,-2.0),
                              blurRadius: 4.0
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:Color(0xffFAFAFA),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: Alignment.center,
                            child: defaultTextFormField(
                                controller: searchController,
                                validator: (value){

                                },
                              text: 'Search',
                              height: 54.0,
                              icon: Icons.search,
                              withBorder: false,
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.greenColor),
                            ),
                            color: AppColors.greenColor,
                            height: 57.0,
                            minWidth: double.infinity,
                            onPressed: (){

                            },
                            child: Text(
                                'Search',
                              style: AppStyles.buttonStyle,
                            ),
                          ),
                          const SizedBox(height: 30.0,),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.greenColor,width: 2.0),
                            ),
                            color: Colors.white,
                            height: 57.0,
                            minWidth: double.infinity,
                            onPressed: (){

                            },
                            child: Text(
                              'Create Post',
                              style: AppStyles.selectedItemInTabBarStyle,
                            ),
                          ),
                        ],
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


//will be delete
  Widget testPostBuilder()=>Column(
    children: [
      Card(
        margin: EdgeInsets.zero,
        elevation: 5.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //profile image
                      CircleAvatar(
                        radius: 22.0,
                        child: ClipOval(
                          child: Image.network(
                            'assets/images/profile.png',
                            width: 44.0,
                            height: 44.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0,),
                      //user name,date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:  MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mohamed Nasser',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                              fontSize: 13.0,
                              color: Color(0xff000000),
                            ),
                          ),
                          const SizedBox(height: 4.0,),
                          Text(
                            'a month ago',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                              color: Color(0xff979797).withOpacity(0.84),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  // post
                  Text(
                    'How To treat cactus plant ?',
                    maxLines: 1,

                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                      color: AppColors.greenColor,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(
                    'leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and',
                    overflow: TextOverflow.ellipsis,
                    maxLines:10,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.0,
                      color: Color(0xff8F8D8D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14.0,),
            Container(
              width: double.infinity,
              height: 300.0,
              color: Colors.black,
              child: Image.network(
                'assets/images/blog_image_test.png' ,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10.0,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/like.png',
          ),
          const SizedBox(width: 4.0,),
          Text(
            '0 Likes ',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: Color(0xff000000).withOpacity(0.60),
            ),
          ),
          const SizedBox(width: 50.0,),
          Text(
            '2 Replies',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 12.0,
              color: Color(0xff000000).withOpacity(0.60),
            ),
          ),
        ],
      ),
    ],
  );


  // list view that build the list of posts.
  Widget testListOfPosts()=>ListView.separated(
    itemBuilder: (context,index)=>testPostBuilder(),
    separatorBuilder: (context,index)=>const SizedBox(height: 30.0,),
    itemCount: 10,
  );


}
