



import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/blogs_screen/blog_description.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

import '../../components/components.dart';
import '../../components/constants.dart';
import '../../models/blogs_model.dart';
import '../../styles/styles.dart';

class BlogsScreen extends  StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon:const Icon(Icons.arrow_back_outlined,size: 26,color: Colors.black,),
              onPressed: (){},
            ),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Text(
                  'Blogs',
                  style: AppStyles.myCartWordStyle,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context,index)=>blogsItemBuilder(cubit.blogsModel!.data!.plants![index],context),
            itemCount: 10,
          ),
        );
      },
    );
  }

  Widget blogsItemBuilder(Plants plant,context)=>GestureDetector(
    onTap: (){
      navigateTo(
          context,
          BlogDescriptionScreen(plant),
      );
    },
    child: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 24.0,vertical: 11.0),
      child: Container(
        padding:const EdgeInsets.all(14.0),
        width: double.infinity,
        height: 161.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            const  BoxShadow(
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
            Container(
                width: 146,height: 133,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    '$baseUrl${plant.imageUrl!}',
                    fit: BoxFit.cover,
                    width: 146,
                    height: 133,),
                ),
            ),

            const SizedBox(width: 18.0,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2 days ago',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.itemPriceStyle,
                    ),
                    const SizedBox(height: 14.0,),
                    Text(
                      plant.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    Text(
                      plant.description!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff7D7B7B),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

}
