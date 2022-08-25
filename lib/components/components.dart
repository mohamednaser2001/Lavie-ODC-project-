


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/responsive/web_modules/web_blogs_screens/web_blog_description.dart';

import '../models/blogs_model.dart';
import '../models/fourms_model.dart';
import '../models/product_model.dart';
import '../modules/home_screen/cubit/app_cubit_states.dart';
import '../styles/styles.dart';
import 'constants.dart';

Widget logoBuilder (Size ? size)=>Container(
  alignment: Alignment.center,
  height:size==null ? 37 : size.height*0.07,
  width: size==null ? 131 : size.width*0.25,
  child: Stack(
    alignment: Alignment.center,
    children:const [
      Image(
        image: AssetImage('assets/images/logo_name.png'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Image(
          width: 23.0,
          height: 15.0,
          image: AssetImage('assets/images/small_logo.png'),
        ),
      ),
    ],
  ),
);


              // text form field builder
Widget defaultTextFormField({
  required TextEditingController controller,
  required String ?validator(String ? str),
  IconData ? icon,
  String ? text,
  bool withBorder =true,
  double height = 46.24,
  bool isDescription =false,
})=>Container(
   width: double.infinity,  // 337.0,
  height:height,
  child: TextFormField(
    controller: controller,
    validator: validator,
    maxLines:isDescription ? 5:1,
    decoration: InputDecoration(
      border: withBorder ? OutlineInputBorder() : InputBorder.none,
      prefixIcon: Icon(icon),
      hintText: text,

    ),
  ),
);


                       // button builder
Widget defaultButton({required String name,required Function onPressed,double height =56.24,double width=337,double radius=5.0})=>Container(
  width: width,
  height: height,
  child: MaterialButton(
    color: AppColors.greenColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
    ),
    onPressed: (){
      onPressed();
    },
    child: Text(
      name,
      style: AppStyles.buttonStyle,
    ),
  ),
);



Widget allCategoriesPage()=>const Center(child: Text('all categories'));
Widget plantsPage()=>const Center(child: Text('plantsPage'));
Widget seedsPage()=>const Center(child: Text('seedsPage'));
Widget toolsPage()=>const Center(child: Text('toolsPage'));

Future<dynamic> navigateToWithoutBack(context,Widget widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context)=> widget,
    ),
        (route) => false
);
Future<dynamic> navigateTo(context,Widget widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder:(context)=>widget ),
);


//this method return the default screen in case of the search or the cart screen is empty.
Widget emptyScreen({
  required String image,
  required String header,
  required String body,
})=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child:   Column(

    mainAxisAlignment: MainAxisAlignment.center,

    children: [

      Image.asset(
        image,
        height: 180,
        width: 180,
      ),

      const SizedBox(height: 40.0,),

      Text(

        'Your cart is empty',
        textAlign: TextAlign.center,

        style: TextStyle(

          fontWeight: FontWeight.w700,

          fontSize: 24.0,

          color: Color(0xff212121),

        ),

      ),

      const SizedBox(height: 12.0,),

      Text(

        'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',

        textAlign: TextAlign.center,

        style: TextStyle(

          fontWeight: FontWeight.w400,

          fontSize: 18.0,

          color: Color(0xff212121).withOpacity(0.61),

        ),

      ),

    ],

  ),
);


Widget defaultTextButton({required String text,required Function onPressed})=>TextButton(
  onPressed: (){
    onPressed();
  },
  child: Text(
    text,
    style: AppStyles.headersOfWebStyle,
  ),
);



Widget blogItem(Plants plant,Size size,context)=>GestureDetector(
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

          height: size.width*0.16,

          color: Colors.black,

          child: Image.network(

            '$baseUrl${plant.imageUrl!}',

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

                plant.name!,

                maxLines: 1,

                overflow: TextOverflow.ellipsis,

                style: GoogleFonts.poppins(

                    fontSize: 20,

                    fontWeight: FontWeight.w600,

                    color: Colors.black

                ),

              ),

              Text(

                plant.description!,

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


                         // method return post design
Widget postBuilder(ForumData forum)=>Column(
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
                          forum.user!.imageUrl!,
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
                          '${forum.user!.firstName!} ${forum.user!.lastName!}',
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
                  forum.title!,
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
                  forum.title!,
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
            height: 150.0,
            color: Colors.black,
            child: Image.network(
               '$baseUrl${forum.imageUrl}' ,
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



                 //contact us screen
Widget contactUs(Size size)=>Container(
  color: Color(0xffFAFAFA),
  width: size.width,
  height: size.height*0.25,
  padding:const EdgeInsets.all(40.0),
  child: Row(
    children: [
      //column #1
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            logoBuilder(null),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LA VIE ',
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greenColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Were dedicated to giving you the very best of plants, with a focus on dependability',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color:const Color(0xff979797),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(width: 20.0,),
      //column #2
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerTextOfContactUs('SECTIONS'),
            itemTextOfContactUs('Home'),
            itemTextOfContactUs('Category'),
            itemTextOfContactUs('New'),
            itemTextOfContactUs('Request To Be Seller'),
          ],
        ),
      ),
      //column #3
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerTextOfContactUs('CONTACT US'),
            itemTextOfContactUs('Phone : 01005518348'),
            itemTextOfContactUs('Phone : 01227627220'),
            itemTextOfContactUs('Email : mohamed@gmail.com'),
            itemTextOfContactUs('Address : 6 October city ,Giza ,egypt'),
          ],
        ),
      ),

      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerTextOfContactUs('SIGN FOR OUR NEWLETEER \nAND GET A 10% DISCOUNT'),
            headerTextOfContactUs('OUR SOCIAL'),



            Container(
              height: 20.0,
              width: 80.0,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/facebook.png',
                    color: Colors.black,
                    width: 20.0,
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0,left: 8.0),
                    child: Image.asset(
                      'assets/images/insta_icon.png',
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
                  Image.asset(
                    'assets/images/twitter_icon.png',
                    width: 20.0,
                    height: 20.0,
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

Widget headerTextOfContactUs(String text)=>Text(
  text,
  style: GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color:AppColors.greenColor,
  ),
);

Widget itemTextOfContactUs(String text)=>Text(
  text,
  style: GoogleFonts.poppins(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color:const Color(0xff979797),
  ),
);

// list view that build the list of posts.
Widget listOfPosts(MyForumsModel forum)=>ListView.separated(
  itemBuilder: (context,index)=>postBuilder(forum.data![index]),
  separatorBuilder: (context,index)=>const SizedBox(height: 30.0,),
  itemCount: forum.data!.length,
);


Widget headerTextOfWebScreens(String text)=>Text(
  text,
  style: GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 30,
    color: Colors.black,
  ),
);


Widget profilePointsCard(double height)=>Container(
  width: double.infinity,
  height: height,
  padding:const EdgeInsets.all(16.0),
  decoration: BoxDecoration(
    color:const Color(0xffF3FEF1),
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: Row(
    children: [
      Image.asset(
        'assets/images/profile_points.png',
        width: 30,
        height: 30,
      ),
      const SizedBox(width: 10.0,),
      Text(
        'You have 30 points',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          color: Colors.black,
        ),
      ),
    ],
  ),
);


Widget headerOfTextFormField(String text)=>Text(
  text,
  style: AppStyles.headerOfTextFormFieldStyle,
);

Widget addPhotoScope({required Function function,required double width,required double height,Color color = AppColors.greenColor})=>GestureDetector(
 onTap: (){
   function();
 },
  child:   Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: color,width: 2.0,),
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(Icons.add,color: color,size: 30.0,),
        const SizedBox(height: 16.0,),
        Text(
          'Add Photo',
          style: GoogleFonts.roboto(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    ),
  ),
);




Widget productItemBuilder(context,ProductData plant,)=>Container(
  height: 270.0,
  width: 174.0,
  child: Stack(
    children: [
      //first layer
      Column(
        children: [
          const SizedBox(height: 43.0,),
          Container(
            height: 227.0,
            width: 174.0,
            padding:const EdgeInsets.all(14.0),
            alignment: Alignment.topRight,
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
                    color: Colors.grey[400]!,
                    spreadRadius: 1.0,
                    offset:const Offset(-0.9,-0.9),
                    blurRadius: 4.0
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 16.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 16.0,
                          height: 16.0,
                          color: Colors.grey,
                          child: Icon(Icons.minimize,color: Colors.black,size: 16,)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0
                          ),
                        ),
                      ),
                      Container(width: 16.0,height: 16.0,color: Colors.grey, child: Icon(Icons.add,color: Colors.black,size: 16,)),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plant.name!,
                      style: AppStyles.itemNameStyle,
                    ),
                    const SizedBox(height: 6.0,),
                    Text(
                      '${plant.price} EGP',
                      style: AppStyles.itemPriceStyle,
                    ),
                    const SizedBox(height: 12.0,),
                    BlocConsumer<AppCubit,AppStates>(
                      listener: (context,state){},
                      builder: (context,state){
                        return Container(
                          width: 148,
                          height: 35,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            color: AppColors.greenColor,
                            onPressed: (){
                              if(!AppCubit.get(context).productsInCart.contains(plant))
                                AppCubit.get(context).addToCart(plant);
                              else print('product added before');
                            },
                            child: Text(
                              'Add To Cart',
                              style: AppStyles.buttonStyle,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // image layer
      Container(
        height: 150.0,
        width: 100.0,
        color: Colors.white,
        child: Image(
          fit: plant.type=='TOOL'||plant.type=='SEED' ? BoxFit.contain : BoxFit.cover,
          image: NetworkImage(
            '$baseUrl${plant.imageUrl!}',
          ),
        ),
      ),
    ],
  ),
);
