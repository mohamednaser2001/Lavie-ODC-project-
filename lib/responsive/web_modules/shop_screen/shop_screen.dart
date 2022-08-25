import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../../components/components.dart';
import '../../../components/constants.dart';
import '../../../models/product_model.dart';
import '../../../styles/styles.dart';

class WebShopScreen  extends StatelessWidget {

  var searchController=TextEditingController();
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
                  'Plants',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40.0,),
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
                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    crossAxisSpacing: size.width*0.05,
                    mainAxisSpacing: size.height*0.07,
                    crossAxisCount: 3,
                    children: List.generate(
                      15,
                          (index) => testShopItem(size),
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
  Widget testShopItem(Size size)=>GestureDetector(
    onTap: (){
      // navigateTo(context, WebBlogsDescriptionScreen(plant));
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

            height: size.width*0.15,

            color: Colors.black,

            child: Image.network(

              'assets/images/blog_image_test.png',

              fit: BoxFit.cover,

            ),

          ),


          Padding(
            padding: const EdgeInsets.all(20.0),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(
                  children: [
                    Expanded(
                      child: Text(

                        '5 Simple Tips treat plant',

                        maxLines: 1,

                        overflow: TextOverflow.ellipsis,

                        style: GoogleFonts.poppins(

                            fontSize: 20,

                            fontWeight: FontWeight.w600,

                            color: Colors.black

                        ),

                      ),
                    ),
                    Text(

                      '110.00 EGP',

                      maxLines: 1,

                      overflow: TextOverflow.ellipsis,

                      style: GoogleFonts.poppins(

                        fontSize: 12,

                        fontWeight: FontWeight.w400,

                        color: AppColors.greenColor,

                      ),

                    ),
                  ],
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
                const SizedBox(height: 20.0,),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: AppColors.greenColor),
                  ),
                  color: AppColors.greenColor,
                  height: 50.0,
                  minWidth: double.infinity,
                  onPressed: (){

                  },
                  child: Text(
                    'Add To Cart',
                    style: AppStyles.buttonStyle,
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
