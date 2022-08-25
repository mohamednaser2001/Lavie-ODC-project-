

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/components/constants.dart';
import 'package:lavie/models/login_model/login_model.dart';
import 'package:lavie/modules/login_screen/login_states.dart';

import '../../shared/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isLogin = true;

  switchBetweenLoginAndRegister(int index){
    if(index==0) isLogin=false;
    else isLogin=true;

    emit(LoginSwitchingDoneState());
  }


  late UserModel userModel;
  void getUserData({required String email,required String password}){
    emit(LoginLoadingState());

    DioHelper.postData(
        url: SIGNIN,
        data: {
          'email':email,
          'password' : password,
        },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState(userModel));
    }).catchError((error){
      print('error from LoginErrorState is $error');
      emit(LoginErrorState(error.toString()));
    });
  }


  void registerNewUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }){
    emit(RegisterLoadingState());

    DioHelper.postData(
      url: REGISTER,
      data: {
        'email':email,
        'password' : password,
        'firstName' : firstName,
        'lastName' : lastName,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(RegisterSuccessState(userModel));
    }).catchError((error){
      print('error from RegisterErrorState is $error');
      emit(RegisterErrorState(error.toString()));
    });
  }


}