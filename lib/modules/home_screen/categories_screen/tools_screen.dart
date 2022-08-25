

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/models/product_model.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../../components/components.dart';
import '../../../models/plants_model.dart';
import '../../../styles/styles.dart';

class ToolsScreen extends  StatelessWidget {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.toolsList.length!=0,
          builder:(context)=> GridView.count(
            physics:const BouncingScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 1/1.54,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: List.generate(
              cubit.toolsList.length,
                  (index) => productItemBuilder(context, cubit.toolsList[index],),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator(color: AppColors.greenColor,)),
        );
      },
    );
  }


}
