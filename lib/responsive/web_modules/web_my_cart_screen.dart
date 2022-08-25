import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../models/product_model.dart';
import '../../modules/home_screen/cubit/cubit.dart';
import '../../styles/styles.dart';

class WebMyCartScreen  extends StatelessWidget {
  const WebMyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.productsInCart.length>0,
          builder: (context)=>Padding(
            padding:const EdgeInsets.symmetric(horizontal: 44.0,vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                                          // header
                Text(
                  'My Cart',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40.0,),
                Row(
                  children: [
                                                         // list of cart items
                    Container(
                      width: size.width*0.55,
                      height: size.height*0.70,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context,index)=> cartBuilder(cubit.productsInCart[index]),
                        itemCount: cubit.productsInCart.length,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Container(
                          width: size.width*0.3,
                          height: size.height*0.35,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    'Sub Total',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '180,000 EGP',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff9D9999),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    'Shopping',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '0,000 EGP',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff9D9999),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12.0,),
                              Container(height: 1.0,color: Colors.grey,width: size.width*0.3,),
                              const SizedBox(height: 20.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                   Text(
                                    'Total',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '180,000 EGP',
                                    style: AppStyles.itemPriceStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30.0,),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Theme.of(context).primaryColor),
                                ),
                                color: AppColors.greenColor,
                                height: 51.0,
                                minWidth: double.infinity,
                                onPressed: (){

                                },
                                child: Text(
                                  'Checkout',
                                  style: AppStyles.buttonStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0,),
                        Container(
                          width: size.width*0.3,
                          height: 51,
                          alignment: Alignment.center,
                          padding:const EdgeInsets.only(left: 20.0),
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration:const InputDecoration(
                                    hintText: 'Enter Your Coupon',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0,),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Theme.of(context).primaryColor),
                                ),
                                color: AppColors.greenColor,
                                height: 51.0,
                                minWidth: 100.0,
                                onPressed: (){

                                },
                                child: Text(
                                  'Apply',
                                  style: AppStyles.buttonStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          fallback:(context)=> Center(
            child: webEmptyCartScreen(),
          ),
        );
      },
    );
  }

  Widget webEmptyCartScreen()=>Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child:   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty_screen_icon.png',
          width: 120.0,
          height: 120.0,
        ),

        const SizedBox(height: 30.0,),
        const Text(
          'Your cart is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
            color: Color(0xff212121),
          ),
        ),

        const SizedBox(height: 40.0,),

        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: AppColors.greenColor,
          height: 51.0,
          minWidth: 200.0,
          onPressed: (){

          },
          child: Text(
            'Keep Shopping',
            style: AppStyles.buttonStyle,
          ),
        ),
      ],

    ),
  );

  Widget cartBuilder(ProductData product)=>Padding(
    padding:const EdgeInsets.symmetric(horizontal: 24.0,vertical: 11.0),
    child: Container(
      padding: EdgeInsets.all(14.0),
      width: double.infinity,
      height: 161.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          const BoxShadow(
              color: Colors.white,
              spreadRadius: 0.0,
              offset: Offset(0.0, 0.0),
              blurRadius: 4.0
          ),
          BoxShadow(
              color: Colors.grey[300]!,
              spreadRadius: 0.0,
              offset:const Offset(-0.5,-0.5),
              blurRadius: 4.0
          ),
        ],
      ),
      child: Row(
        children: [
          Image.network('$baseUrl${product.imageUrl!}',width: 146,height: 133,),
          const SizedBox(width: 18.0,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12.0,),
                  Text(
                    '${product.price!} EGP',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.itemPriceStyle,
                  ),
                  const SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 67.0,
                        height: 36,
                        padding:const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Color(0xffF8F8F8),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:const [
                            Icon(Icons.maximize,color: AppColors.greenColor,size: 16,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Icon(Icons.add,color: AppColors.greenColor,size: 16,),

                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: (){

                        },
                        icon: Icon(Icons.delete,color: AppColors.greenColor,size: 28,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

}
