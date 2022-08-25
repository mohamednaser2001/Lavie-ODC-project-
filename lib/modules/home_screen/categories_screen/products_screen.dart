



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../../components/components.dart';
import '../../../models/plants_model.dart';
import '../../../models/product_model.dart';
import '../../../styles/styles.dart';

class ProductScreen extends  StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.productModel?.data !=null,
          builder:(context)=> GridView.count(
            padding:const EdgeInsets.symmetric(horizontal: 9.0),
            physics:const BouncingScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1/1.63,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: List.generate(
              cubit.productModel!.data!.length,
                  (index) => productItemBuilder(context, cubit.productModel!.data![index]),
            ),
          ),
          fallback: (context)=>const Center(child: CircularProgressIndicator(color: AppColors.greenColor,)),
        );
      },
    );
  }


}
