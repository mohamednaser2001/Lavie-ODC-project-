

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';


import '../../components/components.dart';
import '../../components/constants.dart';
import '../../models/product_model.dart';
import '../../styles/styles.dart';

class MyCartScreen extends  StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit=AppCubit.get(context);
        return Scaffold(
           appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined,size: 26,color: Colors.black,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Text(
                  'My Cart',
                  style: AppStyles.myCartWordStyle,
                ),
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: cubit.productsInCart.length>0,
            builder: (context)=>Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics:const BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>cartBuilder(cubit.productsInCart[index]),
                    itemCount: cubit.productsInCart.length,
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 24.0,vertical: 11.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '180,000 EGP',
                            style: AppStyles.itemPriceStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 37,),
                      Container(
                        width: double.infinity,
                        height: 51.0,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Theme.of(context).primaryColor),
                          ),
                          color: AppColors.greenColor,
                          onPressed: (){

                          },
                          child: Text(
                            'Checkout',
                            style: AppStyles.buttonStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            fallback:(context)=> emptyScreen(
                image: 'assets/images/icon_of_empty_cart_screen.png',
                header:'Your cart is empty',
                body: 'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.'
            ),
          ),
        );
      },
    );
  }

  Widget cartBuilder(ProductData product)=>BlocConsumer<AppCubit,AppStates>(
    listener: (context,states){},
    builder: (context,states){
      return Padding(
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
                              AppCubit.get(context).removeFromCart(product);
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
    },
  );


}
