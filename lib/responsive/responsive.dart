

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/modules/home_screen/cubit/app_cubit_states.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileScaffold;
  final Widget webScaffold;
  ResponsiveLayout({required this.mobileScaffold,required this.webScaffold});

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return LayoutBuilder(
                builder: (context,constraints){
                  if(constraints.maxWidth <500) return mobileScaffold;
                  else return webScaffold;
                }
            );
          },
        );
  }
}
