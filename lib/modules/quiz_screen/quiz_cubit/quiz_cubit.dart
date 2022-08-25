
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lavie/modules/quiz_screen/quiz_cubit/quiz_states.dart';


class QuizCubit extends Cubit<QuizStates>{
  QuizCubit():super(QuizInitialState());

  static QuizCubit get(context)=>BlocProvider.of(context);



  int quizPageViewIndex=0;
  void changeQuizPageViewIndex(int index){
    quizPageViewIndex=index;
    emit(QuizChangeQuizPageViewIndexState());
  }



}