

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/components.dart';
import 'package:lavie/home_Layout/home_layout.dart';
import 'package:lavie/modules/home_screen/cubit/cubit.dart';
import 'package:lavie/modules/quiz_screen/quiz_cubit/quiz_states.dart';
import 'package:lavie/styles/styles.dart';
import 'package:lavie/web_designs/web_layout/web_layout.dart';

import '../../responsive/responsive.dart';
import 'quiz_cubit/quiz_cubit.dart';

class QuizScreen extends  StatelessWidget {


  var quizController = PageController();
  bool isLast=false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     List<Widget> screens=[
       quizBody(size),
       quizBody(size),
       quizBody(size),
     ];
    return BlocProvider(
      create: (context)=>QuizCubit(),
      child: BlocConsumer<QuizCubit,QuizStates>(
        listener: (context,state){},
        builder: (context,state){
          QuizCubit cubit = QuizCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title:const Center(
                child: Text(
                  'Course Exam',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width>500 ? size.width*0.2 : 24.0,
                vertical: 24.0,
              ) ,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Question',
                        style: AppStyles.questionWordStyle,
                      ),
                      const SizedBox(width: 7.0,),
                      Text(
                        '${cubit.quizPageViewIndex+1}',
                        style: AppStyles.questionNumberOfPageStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '/3',
                          style: AppStyles.searchAndTapBarStyle,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      itemBuilder: (context,index) => screens[index],
                      onPageChanged: (index){
                       cubit.changeQuizPageViewIndex(index);
                      },
                      physics: BouncingScrollPhysics(),
                      itemCount: screens.length,
                      controller: quizController,
                    ),
                  ),
                                                   //two buttons
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child:cubit.quizPageViewIndex==0 ?Container() : Container(

                          height: 43.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: AppColors.greenColor,width: 1.5),
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            color: Colors.white,
                            onPressed: (){
                              quizController.previousPage(
                                duration:const Duration(milliseconds: 750,),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                            },
                            child: Text(
                              'Back',
                              style: AppStyles.quizAbstractButtonStyle,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0,),
                      Expanded(
                        child: Container(
                          height: 43.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Theme.of(context).primaryColor),
                            ),
                            color: AppColors.greenColor,
                            onPressed: (){
                              if(cubit.quizPageViewIndex==screens.length-1){
                                  navigateToWithoutBack(
                                    context,
                                      ResponsiveLayout(mobileScaffold: HomeLayout(),webScaffold: WebLayout(),),
                                );
                              }else {
                                quizController.nextPage(
                                  duration:const Duration(milliseconds: 750,),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              }
                            },
                            child:cubit.quizPageViewIndex!=screens.length-1 ? Text(
                              'Next',
                              style: AppStyles.quizButtonStyle,
                            ) : Text(
                              'Finish',
                              style: AppStyles.quizButtonStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
 static Widget quizBody(Size size)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 38.0,),
      Text(
        'What is the user experience?',
        style: AppStyles.questionHeaderStyle,
      ),
      const SizedBox(height: 49.0,),
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0,),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greenColor,width: 2.0),
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'The user experience is how the developer feels about a user.',
                style: AppStyles.questionAnswerStyle,
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 11.0,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 39.0,),
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0,),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greenColor,width: 2.0),
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'The user experience is how the user feels about interacting with or experiencing a product.',
                style: AppStyles.questionAnswerStyle,
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 11.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 9.0,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 39.0,),
      Container(
        padding:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0,),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.greenColor,width: 2.0),
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'The user experience is the attitude the UX designer has about a product.',
                style: AppStyles.questionAnswerStyle,
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 13.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 11.0,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 39.0,),
      if(size.width>500)
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10.0,),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.greenColor,width: 2.0),
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'The user experience is the attitude the UX designer has about a product.',
                  style: AppStyles.questionAnswerStyle,
                ),
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 13.0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 11.0,
                ),
              ),
            ],
          ),
        ),

    ],
  );
  
}
