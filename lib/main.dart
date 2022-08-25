import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/modules/home_screen/home_screen.dart';
import 'package:lavie/responsive/responsive.dart';
import 'package:lavie/shared/local/cache_helper.dart';
import 'package:lavie/shared/remote/dio_helper.dart';
import 'package:lavie/test_screen.dart';
import 'package:lavie/web_designs/web_layout/web_layout.dart';

import 'bloc_observer.dart';
import 'home_Layout/home_layout.dart';
import 'modules/blogs_screen/blog_description.dart';
import 'modules/blogs_screen/blogs_screen.dart';
import 'modules/discussion_forums/discussion_forums.dart';
import 'modules/home_screen/cubit/app_cubit_states.dart';
import 'modules/home_screen/cubit/cubit.dart';
import 'modules/login_screen/login_screen.dart';
import 'modules/my_cart_screen/my_cart_screen.dart';
import 'modules/quiz_screen/quiz_screen.dart';
import 'modules/scanner_screen.dart';
import 'modules/splach_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  token=CacheHelper.getData(key: 'token');
  print(token);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..getProductsData()..getBlogsData()..getProfileData()..getForumsData()..getAllForumsData(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
         return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
            ),

            home:  ResponsiveLayout(mobileScaffold:token==null ? LoginScreen(): HomeLayout(),webScaffold:token==null ? LoginScreen(): WebLayout()),
          );
        },
      ),
    );



  }
}
