


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/components/components.dart';
import 'package:lavie/modules/discussion_forums/discussion_forums.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/modules/login_screen/login_screen.dart';
import 'package:lavie/shared/local/cache_helper.dart';
import 'package:lavie/styles/styles.dart';

import 'edit_email_screen.dart';
import 'edit_name_screen.dart';

class ProfileScreen extends  StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/blog_image_test.png',
                  width: double.infinity,
                  height: size.height*0.27,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding:const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        profilePointsCard(65.0),

                        const SizedBox(height: 24.0,),
                        Text(
                          'Edit Profile',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){
                            navigateTo(context,EditNameScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 65.0,
                            padding:const EdgeInsets.all(16.0),
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
                                    color: Colors.grey[300]!,
                                    spreadRadius: 1.0,
                                    offset:const Offset(-2.0,-2.0),
                                    blurRadius: 4.0
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/change_profile_icon.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 10.0,),
                                Text(
                                  'Change Name',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    color:const Color(0xff2F2E2E),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward,color: Color(0xff1D592C),),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){
                            navigateTo(context, EditEmailScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 65.0,
                            padding:const EdgeInsets.all(16.0),
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
                                    color: Colors.grey[300]!,
                                    spreadRadius: 1.0,
                                    offset:const Offset(-2.0,-2.0),
                                    blurRadius: 4.0
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/change_profile_icon.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 10.0,),
                                Text(
                                  'Change Email',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    color:const Color(0xff2F2E2E),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward,color: Color(0xff1D592C),),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        GestureDetector(
                          onTap: (){
                            navigateTo(context, DiscussionForumsAScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 65.0,
                            padding:const EdgeInsets.all(16.0),
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
                                    color: Colors.grey[300]!,
                                    spreadRadius: 1.0,
                                    offset:const Offset(-2.0,-2.0),
                                    blurRadius: 4.0
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.social_distance,color: AppColors.greenColor,size: 30.0,),
                                const SizedBox(width: 10.0,),
                                Text(
                                  'Community',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    color:const Color(0xff2F2E2E),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward,color: Color(0xff1D592C),),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            radius: 27.0,
                            backgroundColor: AppColors.greenColor,
                            child: IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.logout),
                              onPressed: (){
                                CacheHelper.removeData(key: 'token');
                                navigateToWithoutBack(context, LoginScreen());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Color(0xff0D0D0D).withOpacity(0.87),
              width: double.infinity,
              height: size.height*0.27,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      cubit.profileDataModel!.data!.imageUrl!,
                    ),
                  ),
                  const SizedBox(height: 18.0,),
                  Text(
                    cubit.profileDataModel!.data!.firstName!+' '+cubit.profileDataModel!.data!.lastName! ,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color:Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
