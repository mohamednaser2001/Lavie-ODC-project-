



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/components.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/modules/home_screen/search_screen.dart';
import 'package:lavie/modules/my_cart_screen/my_cart_screen.dart';
import 'package:lavie/modules/quiz_screen/quiz_screen.dart';
import 'package:lavie/shared/local/cache_helper.dart';
import 'package:lavie/styles/styles.dart';
import 'categories_screen/plants_screen.dart';
import 'categories_screen/products_screen.dart';
import 'categories_screen/seeds_screen.dart';
import 'categories_screen/tools_screen.dart';

class HomeScreen extends  StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{

  var pageViewController = PageController();

  @override
  Widget build(BuildContext context) {

                             //list of categories screens in home layout
    List<Widget> screens =[
      ProductScreen(),
      PlantsScreen(),
      SeedsScreen(),
      ToolsScreen(),
    ];

    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  height: size.height*0.05,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      SizedBox(width: double.infinity,height: size.height*0.07,child:logoBuilder(size),),
                      GestureDetector(
                        onTap: (){

                          navigateTo(context,QuizScreen());
                        },
                        child:const CircleAvatar(
                          radius: 15.0,
                            backgroundColor: AppColors.greenColor,
                            child: Icon(Icons.question_mark_outlined,color:Colors.white,size: 22.0,)),
                      ),
                    ],
                  ),
                ),

                                               // logoBuilder(size),
                const SizedBox(height: 40.0,),
                                                   //search bar and cart icon
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          navigateTo(context, SearchScreen());
                        },
                        child: Container(
                          height: 46.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.backgroundOfTextFormFieldColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Row(
                              children: [
                                const Icon(Icons.search,color: AppColors.smallGreyOfLoginScreenColor97,),
                                const SizedBox(width: 15.0,),
                                Text(
                                  'Search',
                                  style: AppStyles.searchAndTapBarStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14.0,),
                    Container(
                      height: 46.0,
                      width: 51.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppColors.greenColor,
                      ),
                      child: MaterialButton(
                          onPressed: (){
                            List<dynamic>inCart = CacheHelper.getData(key: 'productsInCart')==null ? <String>[] : CacheHelper.getData(key: 'productsInCart');
                            cubit.productModel!.data!.forEach((element) {
                              for(int i=0;i<inCart.length-1;i++){
                                if(element.productId==inCart[i]){
                                  cubit.productsInCart.add(element);
                                }
                              }
                            });
                            navigateTo(context, MyCartScreen());
                          },
                          child: Image.asset('assets/images/shopping_cart_logo.png',width: 24.0,height: 24.0,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0,),
                Container(
                  height: 35.0,
                  width: double.infinity,
                                                   //list of buttons to navigate between screens.
                  child: ListView(
                    scrollDirection: Axis.horizontal,

                    children: [
                      customTabItem(index: 0,text: 'All'),
                      customTabItem(index: 1,text: 'Plants'),
                      customTabItem(index: 2,text: 'Seeds'),
                      customTabItem(index: 3,text: 'Tools'),
                    ],

                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: PageView.builder(
                      controller: pageViewController,
                      itemBuilder: (context,index)=> screens[index],
                      onPageChanged: (index){
                        cubit.changeTabBarIndex(index);
                      },
                      itemCount: 4,
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

  Widget customTabItem({required String text,required int index}){
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return GestureDetector(
          onTap: (){
            pageViewController.jumpToPage(index);
          },
          child: Container(
              margin: EdgeInsets.only(right: 14.0),
              width: 90.0,
              height: 35.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.backgroundOfTextFormFieldColor,
                border: cubit.tabBarIndex==index ? Border.all(color: AppColors.greenColor,width: 2.0):Border.all(color: Colors.white,width: 2.0) ,
              ),
              child: Text(
                text,
                style:cubit.tabBarIndex==index ? AppStyles.selectedItemInTabBarStyle : AppStyles.searchAndTapBarStyle,)
          ),
        );
      },
    );
  }
}


