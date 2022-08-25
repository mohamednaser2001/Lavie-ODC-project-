

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../components/components.dart';
import '../../styles/styles.dart';

class HomeWebScreen extends StatelessWidget {
  const HomeWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return ListView(
          children: [
            //home page
            Container(
              height: size.height,
              padding:const EdgeInsets.only(top: 30.0,),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      height: size.height,
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/web_background.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Perfect way to plant in house',
                          style: GoogleFonts.poppins(
                            color: AppColors.greenColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 38.0,
                          ),
                        ),
                        const SizedBox(height: 22.0,),
                        Text(
                          'leaf, in botany, any usually flattened green outgrowth from the stem of a vascular plant. As the primary sites of photosynthesis, leaves manufacture food for plants, which in turn ultimately nourish and sustain all land animals.',
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.41),
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 16.0,),
                        MaterialButton(
                          height: 50.0,
                          minWidth: 250.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: AppColors.greenColor,
                          onPressed:(){},
                          child: Text(
                            'Explore Now',
                            style: AppStyles.buttonStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //categories page
            Container(
              width: size.width,
              height: size.height,
              padding:const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Popular ',
                        style: AppStyles.categoriesHeadersOfWebStyle,
                      ),
                      Container(width: 85.0,height: 4,color: Colors.black,),
                    ],
                  ),
                  Text(
                    'Categories',
                    style: AppStyles.categoriesHeadersOfWebStyle,
                  ),
                  const SizedBox(height: 67,),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder:(context,index)=> categoriesItem(size),
                      separatorBuilder:(context,index)=> SizedBox(width: size.width*0.04,),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            //home page
            Container(
              width: size.width,
              height: size.height,
              padding:const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Best seller ',
                        style: AppStyles.categoriesHeadersOfWebStyle,
                      ),
                      Container(width: 85.0,height: 4,color: Colors.black,),
                    ],
                  ),
                  const SizedBox(height: 67,),
                  Expanded(
                    child: ListView.separated(

                      itemBuilder:(context,index)=> bestSellerItem(size,index),
                      separatorBuilder:(context,index)=> SizedBox(width: size.width*0.04,),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),

            //blogs page
            Container(
              width: size.width,
              height: size.height,
              padding:const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Blogs ',
                        style: AppStyles.categoriesHeadersOfWebStyle,
                      ),
                      Container(width: 85.0,height: 4,color: Colors.black,),
                    ],
                  ),
                  const SizedBox(height: 67,),
                  Container(
                    height: 380,
                    child: ListView.separated(

                      itemBuilder:(context,index)=> blogItem(size),
                      separatorBuilder:(context,index)=> SizedBox(width: size.width*0.04,),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),

            //about us page
            aboutUsScreen(size),
                                      // download mobile app page
            downloadMobileAppPage(size),

            //contact us page
            contactUs(size),

          ],
        );
      },
    );
  }





  Widget bestSellerItem(Size size,int index)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if(index%2!=0) const SizedBox(height: 80.0,),
      Container(
        width: size.width*0.16,
        height: size.width*0.16,
        color: Colors.black,
        child: Image.asset(
          'assets/images/best_seller_test1.png',
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 22,),
      Text(
        'SPIDER PLANT',
        style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
      ),
      Text(
        '190 EGP',
        style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black
        ),
      ),
      if(index%2==0) const SizedBox(height: 80.0,),

    ],
  );

  Widget categoriesItem(  Size size)=> Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: size.width*0.15,
        height: size.width*0.20,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(600.0),
        ),
        child: ClipRRect(
          child: Image.asset(
            'assets/images/categories_web_test1.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(height: 27,),
      Text(
        'Tools',
        style: GoogleFonts.poppins(
            fontSize: 38,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
      ),
    ],
  );

  //about us page builder
  Widget aboutUsScreen(Size size)=> Container(
    width: size.width,
    height: size.height,
    padding:const EdgeInsets.all(40.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width*0.6,
          child: Column(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About us ',
                    style: AppStyles.categoriesHeadersOfWebStyle,
                  ),
                  Container(width: 85.0,height: 4,color: Colors.black,),
                ],
              ),
              const SizedBox(height: 40.0,),
              Text(
                'Welcome to La Vie, your number one source for planting. \nWere dedicated to giving you the very best of plants, with a focus on dependability, customer service and uniqueness.\nFounded in 2020, La Vie has come a long way from its beginnings in a  home office our passion for helping people and give them some advices about how to plant and take care of plants. \nWe now serve customers all over Egypt, and are thrilled to be a part of the eco-friendly wing ',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Color(0xff8D8D8D),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: size.width*0.05,),
        Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 20.0,),
                Container(
                  width: size.width*0.22,
                  height: size.width*0.22,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greenColor,width: 2.0,),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 20.0,),
                Container(
                  width: size.width*0.22,
                  height: size.width*0.22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/about_us_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  // download mobile app page builder
  Widget downloadMobileAppPage(Size size)=>Container(
    width: size.width,
    height: size.height,
    padding:const EdgeInsets.all(40.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width*0.34,
          height: size.height*0.75,
          child: Image.asset(
            'assets/images/download_model_app_image.png',
            fit: BoxFit.cover,
          ),
        ),
        //SizedBox(width: size.width*0.05,),
        Container(
          width: size.width*0.57,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Application ',
                    style: AppStyles.categoriesHeadersOfWebStyle,
                  ),
                  Container(width: 85.0,height: 4,color: Colors.black,),
                ],
              ),
              const SizedBox(height: 40.0,),
              Text(
                'You can install La Vie mobile application and enjoy with new features, earn more points and get discounts\nAlso you can scan QR codes in your plants’ pots so that you can get discount on everything in the website up to 70%',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  height: 1.5,
                  color: Color(0xff8D8D8D),
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                'install by',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12.0,),
              Row(
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      //side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    height: 50.0,
                    minWidth: 180.0,
                    color: Colors.black,
                    onPressed: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/google_play_icon.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                        const SizedBox(width: 25.0,),
                        Text(
                          'Play Store',
                          style: AppStyles.quizButtonStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 25.0,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                      //side: BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    height: 50.0,
                    minWidth: 180.0,
                    color: Colors.black,
                    onPressed: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/apple_store.png',
                          width: 20.0,
                          height: 20.0,
                        ),
                        const SizedBox(width: 25.0,),
                        Text(
                          'App Store',
                          style: AppStyles.quizButtonStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );





  // test blog item builder (the main blog item builder in components that will used with the back-end).
  Widget blogItem(Size size)=>Container(
    width: size.width*0.18,
    height: size.width*0.26,

    decoration: BoxDecoration(
      color: Colors.white,
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: size.width*0.16,
          color: Colors.black,
          child: Image.network(
            'assets/images/blog_image_test.png',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 22,),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2 days ago',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greenColor,
                ),
              ),
              Text(
                '5 Simple Tips treat plant',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                ),
              ),
              Text(
                'leaf, in botany, any usually flattened green outgrowth from the stem of',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff7D7B7B).withOpacity(0.78),
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}
