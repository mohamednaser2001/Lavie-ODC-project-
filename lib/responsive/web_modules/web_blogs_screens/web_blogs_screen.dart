import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/responsive/web_modules/web_blogs_screens/web_blog_description.dart';

import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../models/product_model.dart';
import '../../../styles/styles.dart';

class WebBlogsScreen  extends StatelessWidget {
  const WebBlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: 1>0,// cubit.productModel!.data!.length !=0 ,
          builder: (context)=>Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // header
                Text(
                  'Blogs',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40.0,),
                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    crossAxisSpacing: size.width*0.05,
                    mainAxisSpacing: size.height*0.07,
                    crossAxisCount: 3,
                    children: List.generate(
                      15,
                          (index) => testBlogItem(size,context),
                    ),
                  ),
                ),
              ],
            ),
          ),
          fallback:(context)=> const Center(
            child: Center(child: CircularProgressIndicator(color: AppColors.greenColor,)),
          ),
        );
      },
    );
  }

//just for test web, will be deleted
  Widget testBlogItem(Size size,context)=>GestureDetector(
    onTap: (){
      navigateTo(context, WebBlogsDescriptionScreen());
    },
    child:   Container(

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

    ),
  );


}
